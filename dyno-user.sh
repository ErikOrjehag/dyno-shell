# Source the base configuration.

export DYNO_WS="fast_ws"

source ~/Code/dyno-shell/dyno-base.sh

# Override with user specific settings.

export DYNO_BASE=omnibot
export DYNO_JOY_TYPE=xbox360
export DYNO_USE_ROS_CONTROL_FOR_BASE="true"
export DYNO_DEFAULT_RAPP="dyno_common_rapps/waypoint_navigation"
