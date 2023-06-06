;; Auto-generated. Do not edit!


(when (boundp 'pick_objects::my_robot_pose)
  (if (not (find-package "PICK_OBJECTS"))
    (make-package "PICK_OBJECTS"))
  (shadow 'my_robot_pose (find-package "PICK_OBJECTS")))
(unless (find-package "PICK_OBJECTS::MY_ROBOT_POSE")
  (make-package "PICK_OBJECTS::MY_ROBOT_POSE"))

(in-package "ROS")
;;//! \htmlinclude my_robot_pose.msg.html


(defclass pick_objects::my_robot_pose
  :super ros::object
  :slots (_pose_x _pose_y ))

(defmethod pick_objects::my_robot_pose
  (:init
   (&key
    ((:pose_x __pose_x) 0.0)
    ((:pose_y __pose_y) 0.0)
    )
   (send-super :init)
   (setq _pose_x (float __pose_x))
   (setq _pose_y (float __pose_y))
   self)
  (:pose_x
   (&optional __pose_x)
   (if __pose_x (setq _pose_x __pose_x)) _pose_x)
  (:pose_y
   (&optional __pose_y)
   (if __pose_y (setq _pose_y __pose_y)) _pose_y)
  (:serialization-length
   ()
   (+
    ;; float64 _pose_x
    8
    ;; float64 _pose_y
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _pose_x
       (sys::poke _pose_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pose_y
       (sys::poke _pose_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _pose_x
     (setq _pose_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pose_y
     (setq _pose_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get pick_objects::my_robot_pose :md5sum-) "b2557794f14ba3d93612601bd953900c")
(setf (get pick_objects::my_robot_pose :datatype-) "pick_objects/my_robot_pose")
(setf (get pick_objects::my_robot_pose :definition-)
      "float64 pose_x
float64 pose_y

")



(provide :pick_objects/my_robot_pose "b2557794f14ba3d93612601bd953900c")


