#!/bin/sh

cd ~/home/workspace/catkin_ws


xterm -e " source devel/setup.bash; roslaunch my_robot world.launch; bash" & 
sleep 5

xterm -e " source devel/setup.bash; roslaunch my_robot slam_gmapping.launch; bash " &
sleep 5

xterm -e " source devel/setup.bash; roslaunch turtlebot_rviz_launchers view_navigation.launch; bash " &
sleep 5

xterm -e " source devel/setup.bash; roslaunch turtlebot_teleop keyboard_teleop.launch; bash" 



