#include <ros/ros.h>
#include <visualization_msgs/Marker.h>

visualization_msgs::Marker marker;


double pickup_pose_x = -3.369356,pickup_pose_y=3.955442;
double dropoff_pose_x = -2.733776,dropoff_pose_y = -4.054781;
int step = 0;

void InitMarker()
{
      uint32_t shape = visualization_msgs::Marker::CUBE;
      marker.header.frame_id="map";
      marker.header.stamp=ros::Time::now();
      marker.ns="basic_shapes";
      marker.id=0;
      marker.type = shape;
      marker.action = visualization_msgs::Marker::ADD;

      marker.pose.position.x = 0 ;
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

void SetMarkerPosition(double x,double y)
{
    marker.pose.position.x = x;
    marker.pose.position.y = y;
}

int main(int argc,char** argv)
{
    ros::init(argc,argv,"basic_shapes");
  
    ros::NodeHandle n;
    ros:: Rate r(1);

    ros::Publisher marker_pub=n.advertise<visualization_msgs::Marker>("visualization_marker",1);
  
    InitMarker();
    
    while(ros::ok())
    {
        
        while(marker_pub.getNumSubscribers()<1)
        {
          if(!ros::ok())
          {
            return 0;
          }
          ROS_WARN_ONCE("No subscriber to the marker");
          sleep(1);
        }

        switch(step)
        {

            case 0:
            {
              SetMarkerPosition(pickup_pose_x,pickup_pose_y);
              marker_pub.publish(marker);
              ROS_INFO("Marker at pick up location");
              ++step;
              break;
            }
            case 1:
            {
              ros::Duration(5.0).sleep();
              marker.action = visualization_msgs::Marker::DELETE;
              marker_pub.publish(marker);
              ROS_INFO("Marker deleted");
              ++step;
              break;
            }
            case 2:
            {
              ros::Duration(5.0).sleep();
              marker.action = visualization_msgs::Marker::ADD;
              SetMarkerPosition(dropoff_pose_x,dropoff_pose_y);
              ROS_INFO("Marker at drop off location");
              marker_pub.publish(marker);
              break;
            }

        }
      
      
        ros::spinOnce();

        r.sleep();

    }

  return 0;
}