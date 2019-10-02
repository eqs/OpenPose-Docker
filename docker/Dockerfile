FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04
MAINTAINER Satoshi Murashige

RUN apt-get -y update --fix-missing && apt-get -y upgrade
RUN apt-get install -y sudo wget bzip2 git vim cmake xserver-xorg-dev libgl1-mesa-dev unzip && \
    apt-get install -y x11-apps

RUN apt-get install -y lsof apt-utils lsb-core
RUN apt-get install -y libatlas-base-dev
RUN apt-get install -y libopencv-dev python-opencv python-pip cmake
RUN apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module

# settings
ARG user_name=ubuntu
ARG user_id=1000
ARG group_name=ubuntu
ARG group_id=1000

# create user
RUN groupadd -g ${group_id} ${group_name}
RUN useradd -u ${user_id} -g ${group_id} -d /home/${user_name} \
    --create-home --shell /bin/bash ${user_name}
RUN echo "${user_name} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN chown -R ${user_name}:${group_name} /home/${user_name}

# user settings
ENV HOME /home/${user_name}
ENV LANG en_US.UTF-8

ENV LD_LIBRARY_PATH /usr/local/cuda-9.0/lib64:/usr/local/cuda-9.0/extras/CUPTI/lib64:$LD_LIBRARY_PATH


##### Install Deeplabcut and its dependencies #####

USER ${user_name}
WORKDIR /work

RUN sudo apt-get install -y \
    libgoogle-glog-dev libopencv-dev \
    libprotobuf-dev protobuf-compiler \
    libhdf5-serial-dev \
    libboost-all-dev

# RUN sed -i 's/\<sudo chmod +x $1\>//g' ubuntu/install_caffe_and_openpose_if_cuda8.sh; \
#     sed -i 's/\<sudo chmod +x $1\>//g' ubuntu/install_openpose_if_cuda8.sh; \
#     sed -i 's/\<sudo -H\>//g' 3rdparty/caffe/install_caffe_if_cuda8.sh; \
#     sed -i 's/\<sudo\>//g' 3rdparty/caffe/install_caffe_if_cuda8.sh; \
#     sync; sleep 1; ./ubuntu/install_caffe_and_openpose_if_cuda8.sh

WORKDIR /work
CMD ["/bin/bash"]

