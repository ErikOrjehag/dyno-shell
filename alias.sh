alias dmake='function _blah(){ ( cd ~/catkin_ws && catkin_make $1 ) };_blah'
alias ddep='rosdep install --from-paths ~/catkin_ws/src --ignore-src -r -y'
