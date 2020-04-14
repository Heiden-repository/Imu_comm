#include <ros/ros.h>
#include <opencv2/opencv.hpp>

#include <fcntl.h> // Contains file controls like O_RDWR
#include <errno.h> // Error integer and strerror() function
#include <termios.h> // Contains POSIX terminal control definitions
#include <unistd.h> // write(), read(), close()

#include <thread>

#define buffer_size 100

class Imu_comm
{   
    private:
        ros::NodeHandle nh_;

        int serial_port;
        char str_roll[8];
        char str_pitch[8];
        char str_yaw[8];
        char str_vel_x[8];
        char str_vel_y[8];
        char str_vel_z[8];

        float roll;
        float pitch;
        float yaw;
        float vel_x;
        float vel_y;
        float vel_z;

        bool copy_start;
        int protocol_num;

        bool serial_connect(void);
        unsigned char calcChecksum(unsigned char *data, int leng);
        void send_serial(void);
        void receive_serial(void);

    public:

        void runLoop(void);

        Imu_comm(ros::NodeHandle &_nh):
        nh_(_nh),serial_port(0),copy_start(0),str_roll(""),str_pitch(""),str_yaw(""),str_vel_x(""),str_vel_y(""),str_vel_z(""),roll(0),pitch(0),yaw(0),protocol_num(1),vel_x(0),vel_y(0),vel_z(0)
        {



        }

        ~Imu_comm()
        {
            close(serial_port);
        }
};