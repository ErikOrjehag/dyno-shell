########################### WORKSPACES #############################
file="/opt/ros/kinetic/setup.bash"
if [ -f "$file" ]
then
  source "$file"
fi

if ! [ -z $CONTAINER_NAME ]; then
  source /dyno_entrypoint.sh
fi

file="${DYNO_WS}/devel/setup.bash"
if [ -f "$file" ]
then
  source "$file"
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
  -e CONTAINER_NAME=dyno_dev \
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
  registry.gitlab.com/dynorobotics/dyno_dev
}

dyno_create_minimal() {
  xhost +local:
  docker run -it --net=host \
  --user=$(id -u) \
  -e DISPLAY=$DISPLAY \
  -e QT_GRAPHICSSYSTEM=native \
  -e CONTAINER_NAME=dyno_minimal \
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
  registry.gitlab.com/dynorobotics/dyno_dev:minimal
}

dyno_remove() {
  docker rm dyno-dev
}

dyno_pull() {
  docker pull registry.gitlab.com/dynorobotics/dyno_dev
}

dyno_login() {
  docker login registry.gitlab.com
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


########################### UTILITY  #############################

# soruce bash
sb() {
  source ~/.bashrc
}

# edit bash
eb() {
  vim ~/.bashrc
}

# edit user
eu() {
  vim ~/Code/dyno-shell/dyno-user.sh
}

# edit ros
er() {
  vim ~/Code/dyno-shell/dyno-base.sh
}



########################### CATKIN #############################



dmake() {
  # $1 can be -j1 for example.
  ( cd $DYNO_WS && catkin_make $1 )
}

ddep() {
  rosdep install --from-paths ${DYNO_WS}/src --ignore-src --rosdistro=${ROS_DISTRO} -r -y
}
