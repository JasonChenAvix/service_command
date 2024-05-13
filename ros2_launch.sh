#!/bin/bash
source ~/ros_ws/install/setup.bash
export DISPLAY=:0

# Launch sum_launch.py
ros2 launch gscam2 sum_launch.py &
ros2 run inf_interface inf_interface &
ros2 run drone_following_avix drone_following &

# Wait for 20 seconds
sleep 20

# Launch mq3_bringup_launch.py
ros2 launch mq3_bringup mq3_launch.py

#wait for open all the launch.py
wait
