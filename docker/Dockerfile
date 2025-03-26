# This is an auto generated Dockerfile for ros:ros-core
# generated from docker_images/create_ros_core_image.Dockerfile.em
FROM nvidia/cuda:12.2.0-base-ubuntu20.04
ARG USER=initial
ARG GROUP=initial
ARG UID=1000
ARG GID=${UID}
ARG SHELL=/bin/bash
#FROM $base_image
RUN echo base image: ${base_image}


#######################################################################
##                            Speeding up                            ##
#######################################################################
RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list

#######################################################################
##                      install common packages                      ##
#######################################################################
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
   pkg-config \
   apt-utils \
   wget \
   git \
   build-essential \ 
   net-tools \
   gedit \
   terminator \
   nautilus \
   apt-transport-https \
   libopencv-dev \
   ffmpeg \
   x264 \
   libx264-dev \
   zip \
   unzip \
   usbutils \
   sudo \
   python3-pip \
   libusb-1.0-0-dev \
   dbus-x11

#######################################################################
##                           install python                          ##
#######################################################################

# Install add-apt-repository support
RUN apt-get update && apt-get install -y software-properties-common

# Add deadsnakes PPA and install Python 3.7
RUN add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.7 python3.7-dev python3.7-distutils && \
    ln -s /usr/bin/python3.7 /usr/local/bin/python3.7

# Use the correct get-pip script for Python 3.7
RUN wget https://bootstrap.pypa.io/pip/3.7/get-pip.py && python3.7 get-pip.py && rm get-pip.py

RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1


#######################################################################
##                           install font                            ##
#######################################################################
# RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections 
# RUN apt-get update && apt-get install -y ttf-mscorefonts-installer \
#     ttf-ubuntu-font-family \
#     msttcorefonts -qq \
#     libegl1-mesa \
#     libgl1-mesa-glx \
#     libgles2-mesa-dev
RUN apt-get update && apt-get install -y libegl1-mesa libgl1-mesa-glx libgles2-mesa-dev

RUN python3 -m pip install --upgrade pip
RUN pip install --upgrade pip setuptools wheel
RUN apt-get install  -y python3-ruamel.yaml

#######################################################################
##                       install nvidia docker                       ##
#######################################################################
RUN apt-get install -y --no-install-recommends \
    libxau-dev \
    libxdmcp-dev \
    libxcb1-dev \
    libxext-dev \
    libx11-dev \
    mesa-utils \
    x11-apps

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

# Required for non-glvnd setups.
ENV LD_LIBRARY_PATH /usr/lib/x86_64-linux-gnu:/usr/lib/i386-linux-gnu${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}:/usr/local/nvidia/lib:/usr/local/nvidia/lib64


#######################################################################
##                            ros install                            ##
#######################################################################

# # install packages
# RUN apt-get update && apt-get install -q -y \
#     dirmngr \
#     gnupg2 \
#     lsb-release \
#     curl

# # setup sources.list
# RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list
# # setup keys
# RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
# RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
# RUN curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | apt-key add -
# RUN apt-get update && apt-get install -y \
#     ros-noetic-desktop-full
#  # install ros packages
# ENV ROS_DISTRO noetic
# COPY ./ros_entrypoint.sh /

# RUN apt-get install -y \
#     python3-rosdep \
#     python3-rosinstall \ 
#     python3-rosinstall-generator \ 
#     python3-wstool \
#     build-essential 
#######################################################################
##                   install additional packages                     ##
#######################################################################
# WORKDIR  /
# # setup environment
# ENV LANG C.UTF-8
# ENV LC_ALL C.UTF-8

# RUN apt-get update 
# RUN apt-get install -y libopencv-dev \
#     ros-noetic-map-server \
#     ros-noetic-amcl \
#     ros-noetic-teleop-twist-joy \
#     ros-noetic-camera-calibration \
#     ros-noetic-gmapping \
#     ros-noetic-ros-numpy \
#     ros-noetic-robot-state-publisher \
#     ros-noetic-plotjuggler-ros

# ENTRYPOINT ["/ros_entrypoint.sh"]
# CMD ["bash"]

#######################################################################
##                   install additional packages                     ##
#######################################################################
# RUN apt-get install -y libopencv-dev \
#     ros-${ROS_DISTRO}-map-server \
#     ros-${ROS_DISTRO}-amcl \
#     ros-${ROS_DISTRO}-teleop-twist-joy \
#     ros-${ROS_DISTRO}-camera-calibration \
#     ros-${ROS_DISTRO}-gmapping \
#     ros-${ROS_DISTRO}-ros-numpy \
#     ros-${ROS_DISTRO}-rgbd-launch \
#     ros-${ROS_DISTRO}-openni2-camera \
#     ros-${ROS_DISTRO}-openni2-launch \
#     ros-${ROS_DISTRO}-urg-node \
#     ros-${ROS_DISTRO}-serial
RUN pip install pympler

#######################################################################
##                           install mid360                          ##
#######################################################################
# RUN git clone https://github.com/Livox-SDK/Livox-SDK2.git
# RUN cd Livox-SDK2 && \
#     mkdir build && \
#     cd build && \
#     cmake .. && \
#     make -j8 && \
#     make install

#######################################################################
##                            install VIBE                           ##
#######################################################################

# pipのアップグレード（古いpipでは一部のホイールが扱えない）
RUN pip install --upgrade pip


# 一旦安全な基本セットをインストール
RUN pip install \
    tqdm==4.28.1 \
    yacs==0.1.6 \
    h5py==2.10.0 \
    numpy==1.17.5 \
    scipy==1.4.1

# ここで一度にエラーが出たら、さらに細かく分けて確認
RUN pip install \
    numba==0.47.0 \
    gdown==4.5.1 \
    joblib==0.14.1

RUN pip install --ignore-installed PyYAML==5.3.1

RUN pip install \
    pillow==7.1.0 \
    trimesh==3.5.25 \
    pyrender==0.1.36 \
    progress==1.5

RUN python3.7 --version
RUN python3.7 -m pip --version

# 他の依存はそのまま
RUN pip install \
    filterpy==1.4.5 \
    matplotlib==3.1.3 \
    tensorboard==1.15.0

# TensorFlow 1.15.4 を URL から直接インストール（Python 3.7 用 CPU 版）
RUN python3.7 -m pip install tensorflow==1.15.4


RUN pip install \
    torchvision==0.5.0 \
    scikit-image==0.16.2 \
    scikit-video==1.1.11 \
    opencv-python==4.1.2.30 \
    llvmlite==0.32.1

# gitからのパッケージを個別にインストール
RUN pip install git+https://github.com/mattloper/chumpy.git
RUN pip install git+https://github.com/mkocabas/yolov3-pytorch.git
RUN pip install git+https://github.com/mkocabas/multi-person-tracker.git

# smplxは依存関係に問題がある場合があるため最後に（他との衝突が少ない）
RUN pip install smplx==0.1.26
RUN pip install pyglet==1.5.27
RUN pip install pytube

#######################################################################
##                            delete cash                            ##
#######################################################################
RUN rm -rf /var/lib/apt/lists/*

#######################################################################
##                         make sudoer user                          ##
#######################################################################

ARG USER
ARG USER_ID
RUN groupadd -g 1000 developer && \
    useradd  -g      developer -G sudo -m -u $USER_ID -s /bin/bash ${USER} && \
    echo "${USER}:${USER}" | chpasswd

RUN echo "Defaults visiblepw" >> /etc/sudoers
RUN echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#######################################################################
##                    make user accessible to usb                    ##
#######################################################################
RUN adduser ${USER} dialout


# USER root
USER ${USER}
RUN echo "export PS1='\[\e[1;31;40m\]VIBE\[\e[0m\] \u:\w\$ '">> ~/.bashrc
RUN echo "source /ros_setting.sh">> ~/.bashrc

ARG workspace
WORKDIR ${workspace}
