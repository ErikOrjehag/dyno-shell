########################### WORKSPACES #############################

source /opt/ros/kinetic/setup.bash

if [ -v DYNO_ENABLE_CARTOGRAPHER_WS ]; then
  source ~/cartographer_ws/devel_isolated/setup.bash;
fi

if [ -v DYNO_ENABLE_CATKIN_WS ]; then
  source ~/catkin_ws/devel/setup.bash;
fi

if [ -v DYNO_ENABLE_FAST_WS ]; then
  source ~/fast_ws/devel/setup.bash;
fi

########################### ENVIROMENT #############################


export ROS_MASTER_URI="http://localhost:11311"
export ROS_HOSTNAME="localhost"

export GATEWAY_NETWORK_INTERFACE="enp0s25"

export TURTLEBOT3_MODEL=burger

#export DYNO_BASE="quadrotor"
#export DYNO_BASE="forklift"
export DYNO_BASE="magni"
export DYNO_BASE_VARIANT="sign"

#export DYNO_USE_ROS_CONTROL_FOR_BASE="false" 
export DYNO_USE_ROS_CONTROL_FOR_BASE="true" 

export DYNO_DEFAULT_RAPP="dyno_common_rapps/waypoint_navigation"
#export DYNO_DEFAULT_RAPP="dyno_common_rapps/route_scheduler"
#export DYNO_DEFAULT_RAPP="dyno_quadrotor_rapps/parcel_delivery"

export ROSCONSOLE_CONFIG_FILE="~/Code/dyno-shell/rosconsole.config"

export DYNO_HUB_URI="http://192.168.254.17:6380"
# export DYNO_HUB_URI="http://localhost:6380"



########################### DOCKER #############################



if ! [ -z $CONTAINER_NAME ]; then
  export PS1="($CONTAINER_NAME) $PS1"
fi

dyno_create() {
  xhost +local:
  docker run -it --net=host \
  --user=$(id -u) \
  -e DISPLAY=$DISPLAY \
  -e QT_GRAPHICSSYSTEM=native \
  -e CONTAINER_NAME=dyno-dev \
  -e USER=$USER \
  --workdir=/home/$USER \
  -v "/tmp/.X11-unix:/tmp/.X11-unix" \
  -v "/etc/group:/etc/group:ro" \
  -v "/etc/passwd:/etc/passwd:ro" \
  -v "/etc/shadow:/etc/shadow:ro" \
  -v "/etc/sudoers.d:/etc/sudoers.d:ro" \
  -v "/home/$USER/:/home/$USER/" \
  --device=/dev/dri:/dev/dri \
  --name=dyno-dev \
  dyno:dev	
}

dyno_remove() {
  docker rm dyno-dev
}

ds() {
  docker start -ai dyno-dev
}

da() {
  docker attach dyno-dev
}

dn() {
  docker exec -it dyno-dev bash
}



########################### CATKIN #############################



dmake() {
  # $1 can be -j1 for example.
  ( cd ~/fast_ws && catkin_make $1 )
}

ddep() {
  rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -r -y
}
