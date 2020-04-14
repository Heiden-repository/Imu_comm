#include "imu_comm/imu_comm.hpp"

bool Imu_comm::serial_connect()
{
    serial_port = 0;

    while (ros::ok())
    {
		serial_port = open( "/dev/ttyUSB0", O_RDWR | O_NOCTTY );
		if(serial_port<0)
		{
			std::this_thread::sleep_for(std::chrono::milliseconds(1000));
            printf("Error %i from open: %s\n", errno, strerror(errno));
		}
        else
            break;
    }

    struct termios termi;

    memset( &termi, 0, sizeof(termi) );

    termi.c_cflag = B115200;
    termi.c_cflag |= CS8;
    termi.c_cflag |= CLOCAL;
    termi.c_cflag |= CREAD;
    termi.c_iflag = 0;
    termi.c_oflag = 0;
    termi.c_lflag = 0;
    termi.c_cc[VTIME] = 0;
    termi.c_cc[VMIN] = 0;

    tcflush(serial_port, TCIFLUSH);
    tcsetattr(serial_port, TCSANOW, &termi);
    printf("Imu connection\n");
}

void Imu_comm::send_serial()
{
}

void Imu_comm::receive_serial()
{
    int receive_data = -1;
    int buf_end = 0;

    char data_buf[0];

    receive_data = read(serial_port, data_buf, 1);


    if (receive_data < 0)
    {
        printf("receive_data error \n");
        return;
    }

    if (*data_buf == '*')
    {
        copy_start = true;
        return;
    }
    if (copy_start)
    {
        if (*data_buf == ',')
        {
            protocol_num++;
            return;
        }
        if (protocol_num == 1)
        {
            std::strcat(str_roll, data_buf);
            return;
        }
        else if (protocol_num == 2)
        {
            std::strcat(str_pitch, data_buf);
            return;
        }
        else if (protocol_num == 3)
        {
            std::strcat(str_yaw, data_buf);
            return;
        }
        else if (protocol_num == 4)
        {
            std::strcat(str_vel_x, data_buf);
            return;
        }
        else if (protocol_num == 5)
        {
            std::strcat(str_vel_y, data_buf);
            return;
        }
        else if (protocol_num == 6)
        {
            std::strcat(str_vel_z, data_buf);
            return;
        }
        else if (protocol_num == 7)
        {
            return;
        }
        else
        {
            copy_start = false;
            protocol_num = 1;  
            //printf("roll : %s pitch : %s yaw : %s\n",str_roll,str_pitch,str_yaw);
            roll = atof(str_roll);
            pitch = atof(str_pitch);
            yaw = atof(str_yaw);
            vel_x = atof(str_vel_x);
            vel_y = atof(str_vel_y);
            vel_z = atof(str_vel_z);
            str_roll[0] = {0,};
            str_pitch[0] = {0,};
            str_yaw[0] = {0,};
            str_vel_x[0] = {0,};
            str_vel_y[0] = {0,};
            str_vel_z[0] = {0,};
            printf("roll : %.2lf pitch : %.2lf yaw : %.2lf vel_x : %.2lf vel_y : %.2lf vel_z : %.2lf\n",roll,pitch,yaw,vel_x,vel_y,vel_z);
            return;
        }
    }
}

unsigned char Imu_comm::calcChecksum(unsigned char *data, int leng)
{
    unsigned char csum;

    csum = 0xFF;
    for (; leng > 0; leng--)
        csum += *data++;

    return ~csum;
}


void Imu_comm::runLoop()
{
    serial_connect();
    ros::Rate r(10000);

    while (ros::ok())
    {
        receive_serial();
        //printf("roll : %d pitch : %d yaw : %d\n",roll,pitch,yaw);

        r.sleep();
    }
}