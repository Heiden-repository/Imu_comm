#include "imu_comm/imu_comm.hpp"

void Imu_comm::initvalue(void)
{
    memset(str_imu_info[roll_value], 0, per_imu_info);
    memset(str_imu_info[pitch_value], 0, per_imu_info);
    memset(str_imu_info[yaw_value], 0, per_imu_info);
    memset(str_imu_info[acc_vel_x_value], 0, per_imu_info);
    memset(str_imu_info[acc_vel_y_value], 0, per_imu_info);
    memset(str_imu_info[acc_vel_z_value], 0, per_imu_info);
}

void Imu_comm::initPublisher(ros::NodeHandle &nh_)
{
    imu_info_pub = nh_.advertise<imu_comm::imu_info>("/imu_info", 10);
}

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

    termi.c_cflag = B9600;
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

void Imu_comm::make_imu_info()
{
    imu_comm::imu_info imu_info_msg;

    imu_info_msg.header.seq = msg_seq;
    imu_info_msg.header.stamp = ros::Time::now();
    imu_info_msg.header.frame_id = "/imu_info";

    imu_info_msg.roll = roll;
    imu_info_msg.pitch = pitch;
    imu_info_msg.yaw = yaw;
    imu_info_msg.acc_vel_x = acc_vel_x;
    imu_info_msg.acc_vel_y = acc_vel_y;
    imu_info_msg.acc_vel_z = acc_vel_z;

    imu_info_pub.publish(imu_info_msg);
}

bool Imu_comm::receive_serial()
{
    int receive_data = -1;
    int write_data = -1;
    char for_writing[1]={'*'};
    
    while(1)
    {
        write_data =  write(serial_port,for_writing,1);
        if(write_data > 0) 
        {
            break;
        }
    }

    char check_buffer[1];
    char data_buf[1];
    char for_throwing[1];

    receive_data = read(serial_port, check_buffer, 1);

    if (receive_data < 0)
    {
        return 0;
    }

    if (check_buffer[0] == ascii_recieve_start)
    {
        int protocol_num = 0;
        while (1)
        {
            receive_data = read(serial_port, data_buf, 1);
            
            if (data_buf[0] == ascii_minus || data_buf[0] == ascii_point || ((data_buf[0] >= ascii_num_start) && (data_buf[0] <= ascii_num_end)))
                std::strcat(str_imu_info[protocol_num], data_buf);
            else if (data_buf[0] == ascii_partition)
                protocol_num++;
            else if (data_buf[0] == ascii_recieve_end_first)
            {
                receive_data = read(serial_port, for_throwing, 1);
                break;
            }
             memset(data_buf, 0, 1);
        }

        roll = atof(str_imu_info[roll_value]);
        pitch = atof(str_imu_info[pitch_value]);
        yaw = atof(str_imu_info[yaw_value]);
        acc_vel_x = atof(str_imu_info[acc_vel_x_value]);
        acc_vel_y = atof(str_imu_info[acc_vel_y_value]);
        acc_vel_z = atof(str_imu_info[acc_vel_z_value]);

        memset(str_imu_info[roll_value], 0, per_imu_info);
        memset(str_imu_info[pitch_value], 0, per_imu_info);
        memset(str_imu_info[yaw_value], 0, per_imu_info);
        memset(str_imu_info[acc_vel_x_value], 0, per_imu_info);
        memset(str_imu_info[acc_vel_y_value], 0, per_imu_info);
        memset(str_imu_info[acc_vel_z_value], 0, per_imu_info);

        printf("roll : %.2lf pitch : %.2lf yaw : %.2lf vel_x : %.2lf vel_y : %.2lf vel_z : %.2lf\n", roll, pitch, yaw, acc_vel_x, acc_vel_y, acc_vel_z);
    }

    return 1;
}

bool Imu_comm::send_serial(char* cmd)
{
    send_serial_protocol = ascii_send_start + cmd + ascii_send_end;
    int send_serial_protocol_size = ARRAY_LEN(send_serial_protocol);
    int write_size = write(serial_port, send_serial_protocol, send_serial_protocol_size);
    printf("write_size : %d\n", write_size);
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
    ros::Rate r(100);

    while (ros::ok())
    {
        if (copy_start)
        {
            copy_start = 0;
            copy_start = receive_serial();
        }

        make_imu_info();
 
        //printf("roll : %d pitch : %d yaw : %d\n",roll,pitch,yaw);

        r.sleep();
    }
}