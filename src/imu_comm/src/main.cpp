#include <ros/ros.h>
#include "imu_comm/imu_comm.hpp"

int main(int argc, char **argv)
{
    ros::init(argc, argv,"imu_comm");
    ros::NodeHandle n;

    ROS_INFO("%s", ros::this_node::getName().c_str());

    Imu_comm imu_comm(n);

    imu_comm.runLoop();
    
    return 0;
}