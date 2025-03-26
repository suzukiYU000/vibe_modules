#!/bin/bash -x

cd `dirname $0`

if [ $? -ne 0 ]; then
    echo "=============================" 
    echo "=nvidia docker not installed="
    echo "============================="
    docker_installed=0
    nvidia-container-toolkit -version &> /dev/null
    if [ $? -ne 0 ]; then
        echo "========================================" 
        echo "=nvidia-container-toolkit not installed="
        echo "========================================"
        docker_installed=0
    else
        echo "=====================================" 
        echo "=nvidia-container-toolkit installed="
        echo "===================================="
        docker_installed=1
    fi
else
    docker_installed=1
fi
if [ $docker_installed != 1 ]; then
    echo "=============================" 
    echo "=nvidia docker not installed="
    echo "============================="
    docker build  --tag ${USER}/vibe --build-arg USER=${USER} --build-arg USER_ID=`id -u` --build-arg workspace="/catkin_ws/src/" -f Dockerfile.wo_gpu .
else
    echo "=========================" 
    echo "=nvidia docker installed="
    echo "========================="
    if [[ $USER =~ .*js.* ]]; then
    # jetson
        docker build  --tag ${USER}/vibe --build-arg USER=${USER} --build-arg USER_ID=`id -u` --build-arg workspace="/catkin_ws/src/" -f Dockerfile.jetson .
    else
    # other pc
        docker build  --tag ${USER}/vibe --build-arg USER=${USER} --build-arg USER_ID=`id -u` --build-arg workspace="/catkin_ws/src/" .
    fi
fi
