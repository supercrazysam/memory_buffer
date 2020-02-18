#Dependencies
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install build-essential checkinstall cmake pkg-config yasm -y
sudo apt-get install git gfortran -y
sudo apt-get install libjpeg8-dev libjasper-dev libpng12-dev -y

# If you are using Ubuntu 16.04
sudo apt-get install libtiff5-dev -y
 
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev -y
sudo apt-get install libxine2-dev libv4l-dev -y
sudo apt-get install libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev -y
sudo apt-get install qt5-default libgtk2.0-dev libtbb-dev -y
sudo apt-get install libatlas-base-dev -y
sudo apt-get install libfaac-dev libmp3lame-dev libtheora-dev -y
sudo apt-get install libvorbis-dev libxvidcore-dev -y
sudo apt-get install libopencore-amrnb-dev libopencore-amrwb-dev -y
sudo apt-get install x264 v4l-utils -y
 
# Optional dependencies
sudo apt-get install libprotobuf-dev protobuf-compiler -y
sudo apt-get install libgoogle-glog-dev libgflags-dev -y
sudo apt-get install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen -y


sudo apt-get install python-dev python-pip python3-dev python3-pip -y
sudo -H pip2 install -U pip numpy
sudo -H pip3 install -U pip numpy
# Install start

cd /home/$USER/
mkdir /home/$USER/OPENCV_INSTALL

git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git


mkdir /home/$USER/OPENCV_INSTALL/opencv/build
cd /home/$USER/OPENCV_INSTALL/opencv/build


cmake -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules/ -DBUILD_TIFF=ON -DBUILD_opencv_java=OFF -DWITH_CUDA=ON -DWITH_OPENGL=ON -DWITH_OPENCL=ON -DWITH_IPP=ON -DWITH_TBB=ON -DWITH_EIGEN=ON -DWITH_V4L=ON -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF -DENABLE_FAST_MATH=ON -DCUDA_FAST_MATH=ON -DWITH_CUBLAS=ON -DWITH_GSTREAMER=ON -DWITH_FFMPEG=ON -DCMAKE_BUILD_TYPE=RELEASE -DCUDA_GENERATION=Auto ..

#DCUDA_GENERATION=Kepler is ok   not sure if Auto ok

# find out number of CPU cores in your machine
# nproc
# substitute 4 by output of nproc
make -j$(nproc)
sudo make install
sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig


