; Auto-generated. Do not edit!


(cl:in-package imu_comm-msg)


;//! \htmlinclude imu_info.msg.html

(cl:defclass <imu_info> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (roll
    :reader roll
    :initarg :roll
    :type cl:float
    :initform 0.0)
   (pitch
    :reader pitch
    :initarg :pitch
    :type cl:float
    :initform 0.0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0)
   (acc_gyro_roll
    :reader acc_gyro_roll
    :initarg :acc_gyro_roll
    :type cl:float
    :initform 0.0)
   (acc_gyro_pitch
    :reader acc_gyro_pitch
    :initarg :acc_gyro_pitch
    :type cl:float
    :initform 0.0)
   (acc_gyro_yaw
    :reader acc_gyro_yaw
    :initarg :acc_gyro_yaw
    :type cl:float
    :initform 0.0)
   (acc_vel_x
    :reader acc_vel_x
    :initarg :acc_vel_x
    :type cl:float
    :initform 0.0)
   (acc_vel_y
    :reader acc_vel_y
    :initarg :acc_vel_y
    :type cl:float
    :initform 0.0)
   (acc_vel_z
    :reader acc_vel_z
    :initarg :acc_vel_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass imu_info (<imu_info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <imu_info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'imu_info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name imu_comm-msg:<imu_info> is deprecated: use imu_comm-msg:imu_info instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <imu_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_comm-msg:header-val is deprecated.  Use imu_comm-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'roll-val :lambda-list '(m))
(cl:defmethod roll-val ((m <imu_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_comm-msg:roll-val is deprecated.  Use imu_comm-msg:roll instead.")
  (roll m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <imu_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_comm-msg:pitch-val is deprecated.  Use imu_comm-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <imu_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_comm-msg:yaw-val is deprecated.  Use imu_comm-msg:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'acc_gyro_roll-val :lambda-list '(m))
(cl:defmethod acc_gyro_roll-val ((m <imu_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_comm-msg:acc_gyro_roll-val is deprecated.  Use imu_comm-msg:acc_gyro_roll instead.")
  (acc_gyro_roll m))

(cl:ensure-generic-function 'acc_gyro_pitch-val :lambda-list '(m))
(cl:defmethod acc_gyro_pitch-val ((m <imu_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_comm-msg:acc_gyro_pitch-val is deprecated.  Use imu_comm-msg:acc_gyro_pitch instead.")
  (acc_gyro_pitch m))

(cl:ensure-generic-function 'acc_gyro_yaw-val :lambda-list '(m))
(cl:defmethod acc_gyro_yaw-val ((m <imu_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_comm-msg:acc_gyro_yaw-val is deprecated.  Use imu_comm-msg:acc_gyro_yaw instead.")
  (acc_gyro_yaw m))

(cl:ensure-generic-function 'acc_vel_x-val :lambda-list '(m))
(cl:defmethod acc_vel_x-val ((m <imu_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_comm-msg:acc_vel_x-val is deprecated.  Use imu_comm-msg:acc_vel_x instead.")
  (acc_vel_x m))

(cl:ensure-generic-function 'acc_vel_y-val :lambda-list '(m))
(cl:defmethod acc_vel_y-val ((m <imu_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_comm-msg:acc_vel_y-val is deprecated.  Use imu_comm-msg:acc_vel_y instead.")
  (acc_vel_y m))

(cl:ensure-generic-function 'acc_vel_z-val :lambda-list '(m))
(cl:defmethod acc_vel_z-val ((m <imu_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_comm-msg:acc_vel_z-val is deprecated.  Use imu_comm-msg:acc_vel_z instead.")
  (acc_vel_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <imu_info>) ostream)
  "Serializes a message object of type '<imu_info>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acc_gyro_roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acc_gyro_pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acc_gyro_yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acc_vel_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acc_vel_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acc_vel_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <imu_info>) istream)
  "Deserializes a message object of type '<imu_info>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'roll) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acc_gyro_roll) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acc_gyro_pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acc_gyro_yaw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acc_vel_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acc_vel_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acc_vel_z) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<imu_info>)))
  "Returns string type for a message object of type '<imu_info>"
  "imu_comm/imu_info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'imu_info)))
  "Returns string type for a message object of type 'imu_info"
  "imu_comm/imu_info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<imu_info>)))
  "Returns md5sum for a message object of type '<imu_info>"
  "68254290c37f4da9714737632b52b84a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'imu_info)))
  "Returns md5sum for a message object of type 'imu_info"
  "68254290c37f4da9714737632b52b84a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<imu_info>)))
  "Returns full string definition for message of type '<imu_info>"
  (cl:format cl:nil "Header header~%~%float32 roll~%float32 pitch~%float32 yaw~%~%float32 acc_gyro_roll~%float32 acc_gyro_pitch~%float32 acc_gyro_yaw~%~%float32 acc_vel_x~%float32 acc_vel_y~%float32 acc_vel_z~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'imu_info)))
  "Returns full string definition for message of type 'imu_info"
  (cl:format cl:nil "Header header~%~%float32 roll~%float32 pitch~%float32 yaw~%~%float32 acc_gyro_roll~%float32 acc_gyro_pitch~%float32 acc_gyro_yaw~%~%float32 acc_vel_x~%float32 acc_vel_y~%float32 acc_vel_z~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <imu_info>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <imu_info>))
  "Converts a ROS message object to a list"
  (cl:list 'imu_info
    (cl:cons ':header (header msg))
    (cl:cons ':roll (roll msg))
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':yaw (yaw msg))
    (cl:cons ':acc_gyro_roll (acc_gyro_roll msg))
    (cl:cons ':acc_gyro_pitch (acc_gyro_pitch msg))
    (cl:cons ':acc_gyro_yaw (acc_gyro_yaw msg))
    (cl:cons ':acc_vel_x (acc_vel_x msg))
    (cl:cons ':acc_vel_y (acc_vel_y msg))
    (cl:cons ':acc_vel_z (acc_vel_z msg))
))
