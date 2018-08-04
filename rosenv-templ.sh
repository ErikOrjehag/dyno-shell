#
# Source Workspaces
#

source ~/catkin_ws/devel/setup.bash
source ~/Code/dyno-shell/alias.sh

#
# General ROS Variables
#

ROSCONSOLE_CONFIG_FILE=~/Code/dyno-shell/rosconsole.config

#export GATEWAY_NETWORK_INTERFACE=???

# export ROS_HOSTNAME=???
# export ROS_MASTER_URI=???

#
# Dyno Enviroment Variables
#

export DYNO_BASE=omnibot
export DYNO_JOY_TYPE=xbox360
export DYNO_USE_ROS_CONTROL_FOR_BASE="true"
export DYNO_DEFAULT_RAPP="dyno_common_rapps/waypoint_navigation"
