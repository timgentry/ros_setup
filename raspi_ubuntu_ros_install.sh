#!/bin/bash

# Based on numerous sources including:
# https://github.com/osrf/docker_images/blob/master/ros/noetic/ubuntu/focal/ros-core/Dockerfile

sudo apt update
sudo apt autoremove
sudo apt upgrade

sudo add-apt-repository universe
sudo add-apt-repository restricted
sudo add-apt-repository multiverse

# install packages
sudo apt install -y --no-install-recommends \
    dirmngr gnupg2 curl wget lsb-release git
    # && rm -rf /var/lib/apt/lists/*

if [ ! -f /etc/apt/sources.list.d/ros1-latest.list ]; then
    # setup sources.list
    sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros1-latest.list'

    # setup keys
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
fi

# setup environment
export LANG=C.UTF-8
export LC_ALL=C.UTF-8

export ROS_DISTRO=noetic

# install ros packages
sudo apt install -y --no-install-recommends \
    ros-noetic-ros-desktop=1.5.0-1*
    # && rm -rf /var/lib/apt/lists/*

# echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
# source ~/.bashrc
# OR
# source /opt/ros/noetic/setup.bash
