// Auto-generated. Do not edit!

// (in-package imu_comm.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class imu_info {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.roll = null;
      this.pitch = null;
      this.yaw = null;
      this.acc_gyro_roll = null;
      this.acc_gyro_pitch = null;
      this.acc_gyro_yaw = null;
      this.acc_vel_x = null;
      this.acc_vel_y = null;
      this.acc_vel_z = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('roll')) {
        this.roll = initObj.roll
      }
      else {
        this.roll = 0.0;
      }
      if (initObj.hasOwnProperty('pitch')) {
        this.pitch = initObj.pitch
      }
      else {
        this.pitch = 0.0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
      if (initObj.hasOwnProperty('acc_gyro_roll')) {
        this.acc_gyro_roll = initObj.acc_gyro_roll
      }
      else {
        this.acc_gyro_roll = 0.0;
      }
      if (initObj.hasOwnProperty('acc_gyro_pitch')) {
        this.acc_gyro_pitch = initObj.acc_gyro_pitch
      }
      else {
        this.acc_gyro_pitch = 0.0;
      }
      if (initObj.hasOwnProperty('acc_gyro_yaw')) {
        this.acc_gyro_yaw = initObj.acc_gyro_yaw
      }
      else {
        this.acc_gyro_yaw = 0.0;
      }
      if (initObj.hasOwnProperty('acc_vel_x')) {
        this.acc_vel_x = initObj.acc_vel_x
      }
      else {
        this.acc_vel_x = 0.0;
      }
      if (initObj.hasOwnProperty('acc_vel_y')) {
        this.acc_vel_y = initObj.acc_vel_y
      }
      else {
        this.acc_vel_y = 0.0;
      }
      if (initObj.hasOwnProperty('acc_vel_z')) {
        this.acc_vel_z = initObj.acc_vel_z
      }
      else {
        this.acc_vel_z = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type imu_info
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [roll]
    bufferOffset = _serializer.float32(obj.roll, buffer, bufferOffset);
    // Serialize message field [pitch]
    bufferOffset = _serializer.float32(obj.pitch, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float32(obj.yaw, buffer, bufferOffset);
    // Serialize message field [acc_gyro_roll]
    bufferOffset = _serializer.float32(obj.acc_gyro_roll, buffer, bufferOffset);
    // Serialize message field [acc_gyro_pitch]
    bufferOffset = _serializer.float32(obj.acc_gyro_pitch, buffer, bufferOffset);
    // Serialize message field [acc_gyro_yaw]
    bufferOffset = _serializer.float32(obj.acc_gyro_yaw, buffer, bufferOffset);
    // Serialize message field [acc_vel_x]
    bufferOffset = _serializer.float32(obj.acc_vel_x, buffer, bufferOffset);
    // Serialize message field [acc_vel_y]
    bufferOffset = _serializer.float32(obj.acc_vel_y, buffer, bufferOffset);
    // Serialize message field [acc_vel_z]
    bufferOffset = _serializer.float32(obj.acc_vel_z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type imu_info
    let len;
    let data = new imu_info(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [roll]
    data.roll = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pitch]
    data.pitch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [acc_gyro_roll]
    data.acc_gyro_roll = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [acc_gyro_pitch]
    data.acc_gyro_pitch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [acc_gyro_yaw]
    data.acc_gyro_yaw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [acc_vel_x]
    data.acc_vel_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [acc_vel_y]
    data.acc_vel_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [acc_vel_z]
    data.acc_vel_z = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'imu_comm/imu_info';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '68254290c37f4da9714737632b52b84a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new imu_info(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.roll !== undefined) {
      resolved.roll = msg.roll;
    }
    else {
      resolved.roll = 0.0
    }

    if (msg.pitch !== undefined) {
      resolved.pitch = msg.pitch;
    }
    else {
      resolved.pitch = 0.0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    if (msg.acc_gyro_roll !== undefined) {
      resolved.acc_gyro_roll = msg.acc_gyro_roll;
    }
    else {
      resolved.acc_gyro_roll = 0.0
    }

    if (msg.acc_gyro_pitch !== undefined) {
      resolved.acc_gyro_pitch = msg.acc_gyro_pitch;
    }
    else {
      resolved.acc_gyro_pitch = 0.0
    }

    if (msg.acc_gyro_yaw !== undefined) {
      resolved.acc_gyro_yaw = msg.acc_gyro_yaw;
    }
    else {
      resolved.acc_gyro_yaw = 0.0
    }

    if (msg.acc_vel_x !== undefined) {
      resolved.acc_vel_x = msg.acc_vel_x;
    }
    else {
      resolved.acc_vel_x = 0.0
    }

    if (msg.acc_vel_y !== undefined) {
      resolved.acc_vel_y = msg.acc_vel_y;
    }
    else {
      resolved.acc_vel_y = 0.0
    }

    if (msg.acc_vel_z !== undefined) {
      resolved.acc_vel_z = msg.acc_vel_z;
    }
    else {
      resolved.acc_vel_z = 0.0
    }

    return resolved;
    }
};

module.exports = imu_info;
