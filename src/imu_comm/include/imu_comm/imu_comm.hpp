#include <ros/ros.h>
#include <opencv2/opencv.hpp>

#include "imu_comm/imu_info.h"

#include <fcntl.h> // Contains file controls like O_RDWR
#include <errno.h> // Error integer and strerror() function
#include <termios.h> // Contains POSIX terminal control definitions
#include <unistd.h> // write(), read(), close()

#include <thread>
#include <mutex>

#define imu_info_number 6
#define per_imu_info 7

#define roll_value 0
#define pitch_value 1
#define yaw_value 2
#define acc_vel_x_value 3
#define acc_vel_y_value 4
#define acc_vel_z_value 5


class Imu_comm
{   
    private:
        ros::NodeHandle nh_;

        int serial_port;
        char str_imu_info[imu_info_number][per_imu_info];
        int buffer_size;

        int protocol_num;
        bool copy_start;
        char str_roll[8];
        char str_pitch[8];
        char str_yaw[8];
        char str_vel_x[8];
        char str_vel_y[8];
        char str_vel_z[8];

        float roll;
        float pitch;
        float yaw;
        float acc_vel_x;
        float acc_vel_y;
        float acc_vel_z;

        int msg_seq;

        bool serial_connect(void);
        unsigned char calcChecksum(unsigned char *data, int leng);
        void send_serial(void);
        void receive_serial(void);
        void make_imu_info(void);

        //Publisher
        ros::Publisher imu_info_pub;
        void initPublisher(ros::NodeHandle &nh_);

    public:

        void runLoop(void);

        Imu_comm(ros::NodeHandle &_nh):buffer_size(imu_info_number*per_imu_info),copy_start(0),protocol_num(1),
        nh_(_nh),serial_port(0),msg_seq(1),roll(0.0),pitch(0.0),yaw(0.0),acc_vel_x(0.0),acc_vel_y(0.0),acc_vel_z(0.0)
        {
            serial_connect();
            initPublisher(nh_);
        }

        ~Imu_comm()
        {
            close(serial_port);
        }
};