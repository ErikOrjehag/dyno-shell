# Source the base configuration.

unset  DYNO_ENABLE_CARTOGRAPHER_WS
export DYNO_ENABLE_CATKIN_WS
export DYNO_ENABLE_FAST_WS

source ~/Code/dyno-shell/dyno-base.sh

# Override with user specific settings.

export DYNO_BASE=omnibot
export DYNO_JOY_TYPE=xbox360
export DYNO_USE_ROS_CONTROL_FOR_BASE="true"
export DYNO_DEFAULT_RAPP="dyno_common_rapps/waypoint_navigation"
