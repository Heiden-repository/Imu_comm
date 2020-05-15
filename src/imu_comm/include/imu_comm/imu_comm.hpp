#include <ros/ros.h>
#include <opencv2/opencv.hpp>

#include "imu_comm/imu_info.h"
#include "imu_comm/imu_comm_param.h"

#include <fcntl.h> // Contains file controls like O_RDWR
#include <errno.h> // Error integer and strerror() function
#include <termios.h> // Contains POSIX terminal control definitions
#include <unistd.h> // write(), read(), close()

#include <time.h>
#include <thread>
#include <mutex>


#define imu_info_number 9
#define per_imu_info 7

#define roll_value 0
#define pitch_value 1
#define yaw_value 2
#define gyro_roll_value 3
#define gyro_pitch_value 4
#define gyro_yaw_value 5
#define acc_vel_x_value 6
#define acc_vel_y_value 7
#define acc_vel_z_value 8

#define ARRAY_LEN(X) (sizeof(X)/sizeof(X[0]))

#define ascii_partition 44
#define ascii_recieve_start 42
#define ascii_recieve_end_first 13
#define ascii_recieve_end_second 10
#define ascii_num_start 48
#define ascii_num_end  57
#define ascii_minus 45
#define ascii_point 46
#define ascii_send_start 60
#define ascii_send_end 62

#define baudrate_9600 1
#define baudrate_19200 2
#define baudrate_38400 3
#define baudrate_57600 4
#define baudrate_115200 5
#define baudrate_230400 6
#define baudrate_460800 7
#define baudrate_921600 8

class Imu_comm
{   
    private:
        ros::NodeHandle &nh_;

        int serial_port;
        char str_imu_info[imu_info_number][per_imu_info];
        int buffer_size;

        bool copy_start;
        bool time_check_start;
        char *send_serial_protocol;

        float roll;
        float pitch;
        float yaw;
        float gyro_roll;
        float gyro_pitch;
        float gyro_yaw;
        float acc_vel_x;
        float acc_vel_y;
        float acc_vel_z;

        float prev_gyro_roll;
        float prev_gyro_pitch;
        float prev_gyro_yaw;

        float acc_gyro_roll;
        float acc_gyro_pitch;
        float acc_gyro_yaw;

        int msg_seq;
        std::chrono::system_clock::time_point prev_recieve_time;
        std::chrono::system_clock::time_point recieve_time;

        void initvalue(void);
        void initPublisher(void);
        void initSubscriber(void);
        bool serial_connect(void);
        bool send_serial(imu_comm::imu_comm_param::Request&,imu_comm::imu_comm_param::Response&);
        bool receive_serial(void);
        void make_imu_info(void);

        //Publisher
        ros::Publisher imu_info_pub;

        //Subscriber
        ros::ServiceServer imu_comm_setting_server;

    public:

        void runLoop(void);

        Imu_comm(ros::NodeHandle &_nh):buffer_size(imu_info_number*per_imu_info),copy_start(1),
        nh_(_nh),serial_port(0),msg_seq(1),roll(0.0),pitch(0.0),yaw(0.0),acc_vel_x(0.0),acc_vel_y(0.0),acc_vel_z(0.0)
        {
            initvalue();
            serial_connect();
            initPublisher();
            initSubscriber();
        }

        ~Imu_comm()
        {
            close(serial_port);
        }
};