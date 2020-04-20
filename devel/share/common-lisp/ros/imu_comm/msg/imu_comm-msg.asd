
(cl:in-package :asdf)

(defsystem "imu_comm-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "imu_info" :depends-on ("_package_imu_info"))
    (:file "_package_imu_info" :depends-on ("_package"))
  ))