#!/bin/sh

cd ~/home/workspace/catkin_ws


xterm -e " source devel/setup.bash; roslaunch my_robot world.launch; bash" & 
sleep 5

xterm -e " source devel/setup.bash; roslaunch my_robot add_markers.launch; bash "&
sleep 3

xterm -e " source devel/setup.bash; roslaunch my_robot amcl.launch; bash " &
sleep 5

xterm -e " source devel/setup.bash; roslaunch turtlebot_rviz_launchers view_navigation.launch; bash "&
sleep 5

xterm -e " source devel/setup.bash; roslaunch my_robot pick_objects.launch; bash "




