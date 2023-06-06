
(cl:in-package :asdf)

(defsystem "pick_objects-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "my_robot_pose" :depends-on ("_package_my_robot_pose"))
    (:file "_package_my_robot_pose" :depends-on ("_package"))
  ))