; Auto-generated. Do not edit!


(cl:in-package pick_objects-msg)


;//! \htmlinclude my_robot_pose.msg.html

(cl:defclass <my_robot_pose> (roslisp-msg-protocol:ros-message)
  ((pose_x
    :reader pose_x
    :initarg :pose_x
    :type cl:float
    :initform 0.0)
   (pose_y
    :reader pose_y
    :initarg :pose_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass my_robot_pose (<my_robot_pose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <my_robot_pose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'my_robot_pose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pick_objects-msg:<my_robot_pose> is deprecated: use pick_objects-msg:my_robot_pose instead.")))

(cl:ensure-generic-function 'pose_x-val :lambda-list '(m))
(cl:defmethod pose_x-val ((m <my_robot_pose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_objects-msg:pose_x-val is deprecated.  Use pick_objects-msg:pose_x instead.")
  (pose_x m))

(cl:ensure-generic-function 'pose_y-val :lambda-list '(m))
(cl:defmethod pose_y-val ((m <my_robot_pose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_objects-msg:pose_y-val is deprecated.  Use pick_objects-msg:pose_y instead.")
  (pose_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <my_robot_pose>) ostream)
  "Serializes a message object of type '<my_robot_pose>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pose_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pose_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <my_robot_pose>) istream)
  "Deserializes a message object of type '<my_robot_pose>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pose_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pose_y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<my_robot_pose>)))
  "Returns string type for a message object of type '<my_robot_pose>"
  "pick_objects/my_robot_pose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'my_robot_pose)))
  "Returns string type for a message object of type 'my_robot_pose"
  "pick_objects/my_robot_pose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<my_robot_pose>)))
  "Returns md5sum for a message object of type '<my_robot_pose>"
  "b2557794f14ba3d93612601bd953900c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'my_robot_pose)))
  "Returns md5sum for a message object of type 'my_robot_pose"
  "b2557794f14ba3d93612601bd953900c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<my_robot_pose>)))
  "Returns full string definition for message of type '<my_robot_pose>"
  (cl:format cl:nil "float64 pose_x~%float64 pose_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'my_robot_pose)))
  "Returns full string definition for message of type 'my_robot_pose"
  (cl:format cl:nil "float64 pose_x~%float64 pose_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <my_robot_pose>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <my_robot_pose>))
  "Converts a ROS message object to a list"
  (cl:list 'my_robot_pose
    (cl:cons ':pose_x (pose_x msg))
    (cl:cons ':pose_y (pose_y msg))
))
