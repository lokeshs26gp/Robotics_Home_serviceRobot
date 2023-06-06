# Home Service Robot

Packages used for different tasks
world:my_robot
robot:my_robot - modified parameters to receive velocity from turtlebot_teleop keyboard topic
input_Keyboard:turtlebot_teleop 
SLAM_mapping:gmapping - modified frames according to the robots parameters

Localization:amcl - tuned config parameters to avoid drifting/collision with obstacles
Navigation: move_base - navigating to the desired position
object pick:pick_objects - publish rosmsg my_robot_pose x,y when 
marker : add_markers 
turtlebot_rviz_launchers: view navigation in rviz

pick_objects:
publish rosmsg my_robot_pose x,y. 
publish (0,0) position to hide the marker

