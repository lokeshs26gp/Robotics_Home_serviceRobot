#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include "pick_objects/my_robot_pose.h"
#include <std_msgs/Float64.h>

typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;

bool GoTO(MoveBaseClient& ac, move_base_msgs::MoveBaseGoal& goal, double x,double y)
{
   
   goal.target_pose.pose.position.x = x;
   goal.target_pose.pose.position.y = y;
   goal.target_pose.pose.orientation.w=1.0;

   ROS_INFO("sending goal");
   
   ac.sendGoal(goal);
   ac.waitForResult();
   
  return ac.getState()==actionlib::SimpleClientGoalState::SUCCEEDED;
}

void PublishRobotPose( ros::Publisher& robot_pos_pub,double x,double y)
{
   pick_objects::my_robot_pose msg;
   msg.pose_x = x;
   msg.pose_y = y;
   robot_pos_pub.publish(msg);
   ros::spinOnce();
}

int main(int argc, char** argv)
{
   ros::init(argc,argv,"simple_navigation_goals");

   ros::NodeHandle n;

   ros::Publisher robot_pos_pub = n.advertise<pick_objects::my_robot_pose>("robot_pose_events",10);
   
   MoveBaseClient ac("move_base",true);

   PublishRobotPose(robot_pos_pub,-3.369356,3.955442);

   while(!ac.waitForServer(ros::Duration(5.0))){
    ROS_INFO("waiting for the move_base action server to come up");
   }

   move_base_msgs::MoveBaseGoal goal;

   goal.target_pose.header.frame_id="map";
   goal.target_pose.header.stamp= ros::Time::now();

   if(GoTO(ac,goal,-3.369356,3.955442))
   {
      ROS_INFO("Successfully reached pick up position");
      PublishRobotPose(robot_pos_pub,0.0,0.0);
      ros::Duration(5.0).sleep();
      if(GoTO(ac,goal,-2.733776,-4.054781))
      {
        ROS_INFO("Successfully reached drop position");
        PublishRobotPose(robot_pos_pub,-2.733776,-4.054781);
        ros::Duration(5.0).sleep();
        if(GoTO(ac,goal,-8.908741,-1.779236))
        {
          ROS_INFO("Successfully completed the mission");
        }
        else 
            ROS_INFO("something went wrong");
      }
      else 
        ROS_INFO("something went wrong");
   }
   else 
       ROS_INFO("something went wrong");

   return 0;
}



