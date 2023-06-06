#include <ros/ros.h>
#include <visualization_msgs/Marker.h>
#include <pick_objects/my_robot_pose.h>
#include <std_msgs/Float64.h>

visualization_msgs::Marker marker;
pick_objects::my_robot_pose msg;
void InitMarker()
{
      uint32_t shape = visualization_msgs::Marker::CUBE;
      marker.header.frame_id="map";
      marker.header.stamp=ros::Time::now();
      marker.ns="basic_shapes";
      marker.id=0;
      marker.type = shape;
      marker.action = visualization_msgs::Marker::ADD;

      marker.pose.position.x =0;
      marker.pose.position.y =0;
      marker.pose.position.z =0;

      marker.pose.orientation.x =0;
      marker.pose.orientation.y =0;
      marker.pose.orientation.z =0;

      marker.scale.x =0.25;
      marker.scale.y =0.25;
      marker.scale.z =0.25;

      marker.color.r =0.0f;
      marker.color.g =0.0f;
      marker.color.b =1.0f;
      marker.color.a =1.0f;
      
      marker.lifetime = ros::Duration();
}

void MsgCallBack(const pick_objects::my_robot_pose& pMsg)
{
  ROS_INFO("marker position received!");
  msg = pMsg;
    
}
int main(int argc,char** argv)
{
    ros::init(argc,argv,"basic_shapes");
  
    ros::NodeHandle n;
    ros:: Rate r(1);

    ros::Publisher marker_pub=n.advertise<visualization_msgs::Marker>("visualization_marker",1);
    ros:: Subscriber robot_pose_sub = n.subscribe("/robot_pose_events",10,MsgCallBack);
  
    InitMarker();
    while(ros::ok())
    {
        ros::spinOnce();

        marker.pose.position.x =msg.pose_x;
        marker.pose.position.y =msg.pose_y;
        
        while(marker_pub.getNumSubscribers()<1)
        {
          if(!ros::ok())
          {
            return 0;
          }
          ROS_WARN_ONCE("No subscriber to the marker");
          sleep(1);
        }
        if(marker.pose.position.x == 0.0 && marker.pose.position.y == 0.0)
        {
          ROS_INFO("marker is hidden!");
          marker.color.a =0.0f;
        }
        else 
            marker.color.a =1.0f;

        marker_pub.publish(marker);
        
        r.sleep();

    }

  return 0;
}