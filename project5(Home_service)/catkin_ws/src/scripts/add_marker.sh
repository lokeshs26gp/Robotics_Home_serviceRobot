#!/bin/sh

cd ~/home/workspace/catkin_ws


xterm -e " source devel/setup.bash; roslaunch my_robot world.launch; bash" & 
sleep 5

xterm -e " source devel/setup.bash; roslaunch my_robot amcl.launch; bash " &
sleep 5

xterm -e " source devel/setup.bash; roslaunch turtlebot_rviz_launchers view_navigation.launch; bash "&
sleep 5

xterm -e " source devel/setup.bash; rosrun add_markers add_marker_by_timer; bash"

