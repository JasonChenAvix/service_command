#!/bin/bash
#change the path of your ros_ws
source ~/Documents/avix/v1.0.1_ws/install/setup.bash
export DISPLAY=:0

# Launch sum_launch.py
ros2 run mq3_bringup mq3_bringup &
ros2 run avix_interfaces icp_node &
ros2 run avix_interfaces ktg_node &
ros2 run avix_interfaces ktg_passthrough_node &
ros2 run object_detection_avix tracking_node &
ros2 launch gscam2 node_param_launch.py &
ros2 run avix_controllers gimbal_tracking_node &
ros2 run avix_controllers drone_following_node &

#wait for open all the launch.py
wait

~                                                                               
~                                                                               
~                    
