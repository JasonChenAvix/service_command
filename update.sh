
#!/bin/bash

# Path to the repositories
REPO_PATH="/home/nvidia/ros_ws/src"

# List of repositories to update
declare -a repos=("avix_action" "avix_msg" "gscam2" "object_detection_avix" "gimbal_tracking_avix" "ktg_ros_interface" "mq3_bringup"  )

# Navigate to the repository path
cd $REPO_PATH

# Update each repository
for repo in "${repos[@]}"; do
  echo "Updating $repo..."
  cd $repo
  git pull
  cd ..
done

echo "All repositories have been updated."

# Navigate to the workspace root
cd ..

# Source the setup script
echo "Sourcing the environment..."
source install/setup.bash



# Specify packages to build (avix_msg and action)
echo "Building avix_msg and avix_action..."
declare -a packages_to_build1=("avix_msg" "avix_action")

# Build specific packages
echo "Building selected packages..."
colcon build --packages-select ${packages_to_build1[@]}

# Source the setup script reload msg and action
echo "Sourcing the environment..."
source install/setup.bash

# Specify packages to build (rest of the packages)
echo "Building required packages"
declare -a packages_to_build2=("gscam2" "object_detection_avix" "gimbal_tracking_avix" "ktg_ros_interface" "mq3_bringup" )

# Build specific packages
echo "Building selected packages..."
colcon build --packages-select ${packages_to_build2[@]}

echo "Build complete."

