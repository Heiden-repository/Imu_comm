#include "imu_comm/imu_comm.hpp"

void Imu_comm::initvalue(void)
{
    time_check_start = 0;

    float prev_gyro_roll = 0.0;
    float prev_gyro_pitch = 0.0;
    float prev_gyro_yaw = 0.0;

    float acc_gyro_roll = 0.0;
    float acc_gyro_pitch = 0.0;
    float acc_gyro_yaw = 0.0;

    memset(str_imu_info[roll_value], 0, per_imu_info);
    memset(str_imu_info[pitch_value], 0, per_imu_info);
    memset(str_imu_info[yaw_value], 0, per_imu_info);
    memset(str_imu_info[gyro_roll_value], 0, per_imu_info);
    memset(str_imu_info[gyro_pitch_value], 0, per_imu_info);
    memset(str_imu_info[gyro_yaw_value], 0, per_imu_info);
    memset(str_imu_info[acc_vel_x_value], 0, per_imu_info);
    memset(str_imu_info[acc_vel_y_value], 0, per_imu_info);
    memset(str_imu_info[acc_vel_z_value], 0, per_imu_info);
}

void Imu_comm::initPublisher(ros::NodeHandle &nh_)
{
    imu_info_pub = nh_.advertise<imu_comm::imu_info>("/imu_info", 10);
    //imu_comm_setting_server = nh_.advertiseService("/imu_setting_srv",&Imu_comm::send_serial);
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

    imu_info_msg.acc_gyro_roll = acc_gyro_roll;
    imu_info_msg.acc_gyro_pitch = acc_gyro_pitch;
    imu_info_msg.acc_gyro_yaw = acc_gyro_yaw;

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
        gyro_roll = atof(str_imu_info[gyro_roll_value]);
        gyro_pitch = atof(str_imu_info[gyro_pitch_value]);
        gyro_yaw = atof(str_imu_info[gyro_yaw_value]);
        acc_vel_x = atof(str_imu_info[acc_vel_x_value]);
        acc_vel_y = atof(str_imu_info[acc_vel_y_value]);
        acc_vel_z = atof(str_imu_info[acc_vel_z_value]);

        recieve_time = std::chrono::system_clock::now();

        if (time_check_start)
        {
            std::chrono::milliseconds for_count_duration_time = std::chrono::duration_cast<std::chrono::milliseconds>(recieve_time - prev_recieve_time);
            //std::cout << "duration_time : " << for_count_duration_time.count() << " milliseconds" << std::endl;

            float duration_time_milli = for_count_duration_time.count();
            acc_gyro_roll = (gyro_roll - prev_gyro_roll) / duration_time_milli;
            acc_gyro_pitch = (gyro_pitch - prev_gyro_pitch) / duration_time_milli;
            acc_gyro_yaw = (gyro_yaw - prev_gyro_yaw) / duration_time_milli;

            std::cout << "acc_gyro_roll : " << acc_gyro_roll << std::endl;
            std::cout << "acc_gyro_pitch : " << acc_gyro_pitch << std::endl;
            std::cout << "acc_gyro_yaw : " << acc_gyro_yaw << std::endl;
        }

        prev_gyro_roll = gyro_roll;
        prev_gyro_pitch = gyro_pitch;
        prev_gyro_yaw = gyro_yaw;

        prev_recieve_time = recieve_time;

        memset(str_imu_info[roll_value], 0, per_imu_info);
        memset(str_imu_info[pitch_value], 0, per_imu_info);
        memset(str_imu_info[yaw_value], 0, per_imu_info);
        memset(str_imu_info[gyro_roll_value], 0, per_imu_info);
        memset(str_imu_info[gyro_pitch_value], 0, per_imu_info);
        memset(str_imu_info[gyro_yaw_value], 0, per_imu_info);
        memset(str_imu_info[acc_vel_x_value], 0, per_imu_info);
        memset(str_imu_info[acc_vel_y_value], 0, per_imu_info);
        memset(str_imu_info[acc_vel_z_value], 0, per_imu_info);

        if (!time_check_start)
        {
            time_check_start = 1;
            return 1;
        }
        //printf("roll : %.2lf pitch : %.2lf yaw : %.2lf gyro_roll : %.2f gyro_pitch : %.2lf gyro_yaw : %.2lf acc_vel_x : %.2lf acc_vel_y : %.2lf acc_vel_z : %.2lf\n", roll, pitch, yaw, gyro_roll, gyro_pitch, gyro_yaw, acc_vel_x, acc_vel_y, acc_vel_z);
        //printf("gyro_roll : %.2f gyro_pitch : %.2lf gyro_yaw : %.2lf acc_vel_x : %.2lf acc_vel_y : %.2lf acc_vel_z : %.2lf\n", gyro_roll, gyro_pitch, gyro_yaw, acc_vel_x, acc_vel_y, acc_vel_z);
    }
    return 1;
}

bool Imu_comm::send_serial(imu_comm::imu_comm_param::Request &imu_setting_srv)
{
    // char cmd = (char)imu_setting_srv.command_name;
    // char data = (char)imu_setting_srv.data;
    // send_serial_protocol = (char)ascii_send_start + cmd + data + (char)ascii_send_end;
    // int send_serial_protocol_size = ARRAY_LEN(send_serial_protocol);
    // int write_size = write(serial_port, send_serial_protocol, send_serial_protocol_size);
    // printf("write_size : %d\n", write_size);
}

void Imu_comm::runLoop()
{
    ros::Rate r(150);

    while (ros::ok())
    {
        if (copy_start)
        {
            copy_start = 0;
            copy_start = receive_serial();
            make_imu_info();
        }
        //printf("roll : %d pitch : %d yaw : %d\n",roll,pitch,yaw);
        r.sleep();
    }
}