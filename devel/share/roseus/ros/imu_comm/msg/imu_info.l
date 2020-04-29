;; Auto-generated. Do not edit!


(when (boundp 'imu_comm::imu_info)
  (if (not (find-package "IMU_COMM"))
    (make-package "IMU_COMM"))
  (shadow 'imu_info (find-package "IMU_COMM")))
(unless (find-package "IMU_COMM::IMU_INFO")
  (make-package "IMU_COMM::IMU_INFO"))

(in-package "ROS")
;;//! \htmlinclude imu_info.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass imu_comm::imu_info
  :super ros::object
  :slots (_header _roll _pitch _yaw _acc_gyro_roll _acc_gyro_pitch _acc_gyro_yaw _acc_vel_x _acc_vel_y _acc_vel_z ))

(defmethod imu_comm::imu_info
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:roll __roll) 0.0)
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    ((:acc_gyro_roll __acc_gyro_roll) 0.0)
    ((:acc_gyro_pitch __acc_gyro_pitch) 0.0)
    ((:acc_gyro_yaw __acc_gyro_yaw) 0.0)
    ((:acc_vel_x __acc_vel_x) 0.0)
    ((:acc_vel_y __acc_vel_y) 0.0)
    ((:acc_vel_z __acc_vel_z) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _roll (float __roll))
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   (setq _acc_gyro_roll (float __acc_gyro_roll))
   (setq _acc_gyro_pitch (float __acc_gyro_pitch))
   (setq _acc_gyro_yaw (float __acc_gyro_yaw))
   (setq _acc_vel_x (float __acc_vel_x))
   (setq _acc_vel_y (float __acc_vel_y))
   (setq _acc_vel_z (float __acc_vel_z))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:acc_gyro_roll
   (&optional __acc_gyro_roll)
   (if __acc_gyro_roll (setq _acc_gyro_roll __acc_gyro_roll)) _acc_gyro_roll)
  (:acc_gyro_pitch
   (&optional __acc_gyro_pitch)
   (if __acc_gyro_pitch (setq _acc_gyro_pitch __acc_gyro_pitch)) _acc_gyro_pitch)
  (:acc_gyro_yaw
   (&optional __acc_gyro_yaw)
   (if __acc_gyro_yaw (setq _acc_gyro_yaw __acc_gyro_yaw)) _acc_gyro_yaw)
  (:acc_vel_x
   (&optional __acc_vel_x)
   (if __acc_vel_x (setq _acc_vel_x __acc_vel_x)) _acc_vel_x)
  (:acc_vel_y
   (&optional __acc_vel_y)
   (if __acc_vel_y (setq _acc_vel_y __acc_vel_y)) _acc_vel_y)
  (:acc_vel_z
   (&optional __acc_vel_z)
   (if __acc_vel_z (setq _acc_vel_z __acc_vel_z)) _acc_vel_z)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _roll
    4
    ;; float32 _pitch
    4
    ;; float32 _yaw
    4
    ;; float32 _acc_gyro_roll
    4
    ;; float32 _acc_gyro_pitch
    4
    ;; float32 _acc_gyro_yaw
    4
    ;; float32 _acc_vel_x
    4
    ;; float32 _acc_vel_y
    4
    ;; float32 _acc_vel_z
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _acc_gyro_roll
       (sys::poke _acc_gyro_roll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _acc_gyro_pitch
       (sys::poke _acc_gyro_pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _acc_gyro_yaw
       (sys::poke _acc_gyro_yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _acc_vel_x
       (sys::poke _acc_vel_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _acc_vel_y
       (sys::poke _acc_vel_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _acc_vel_z
       (sys::poke _acc_vel_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _roll
     (setq _roll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pitch
     (setq _pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _acc_gyro_roll
     (setq _acc_gyro_roll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _acc_gyro_pitch
     (setq _acc_gyro_pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _acc_gyro_yaw
     (setq _acc_gyro_yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _acc_vel_x
     (setq _acc_vel_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _acc_vel_y
     (setq _acc_vel_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _acc_vel_z
     (setq _acc_vel_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get imu_comm::imu_info :md5sum-) "68254290c37f4da9714737632b52b84a")
(setf (get imu_comm::imu_info :datatype-) "imu_comm/imu_info")
(setf (get imu_comm::imu_info :definition-)
      "Header header

float32 roll
float32 pitch
float32 yaw

float32 acc_gyro_roll
float32 acc_gyro_pitch
float32 acc_gyro_yaw

float32 acc_vel_x
float32 acc_vel_y
float32 acc_vel_z
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :imu_comm/imu_info "68254290c37f4da9714737632b52b84a")


