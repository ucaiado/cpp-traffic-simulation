FROM ubuntu:16.04
RUN apt update -y && \
    apt install build-essential wget vim libcairo2-dev libgraphicsmagick1-dev clang-format \
    libgtk2.0-dev pkg-config unzip gdb \
    libpng-dev software-properties-common -y && \
    apt-add-repository ppa:ubuntu-toolchain-r/test -y  && \
    apt update -y && \
    apt install g++-7 -y && \
    rm /usr/bin/g++ && \
    ln -s /usr/bin/g++-7 /usr/bin/g++ &&\
    wget https://github.com/Kitware/CMake/releases/download/v3.14.3/cmake-3.14.3.tar.gz && \
    tar xzvf cmake-3.14.3.tar.gz && chmod +x /cmake-3.14.3/bootstrap
WORKDIR /cmake-3.14.3
RUN ./bootstrap && make && make install

# Install Open CV - Warning, this takes absolutely forever
WORKDIR /
ENV OPENCV_VERSION="4.1.0"
RUN wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip \
&& unzip ${OPENCV_VERSION}.zip \
&& mkdir /opencv-${OPENCV_VERSION}/cmake_binary \
&& cd /opencv-${OPENCV_VERSION}/cmake_binary \
&& cmake -DBUILD_TIFF=ON \
  -DBUILD_opencv_java=OFF \
  -DWITH_CUDA=OFF \
  -DWITH_OPENGL=ON \
  -DWITH_OPENCL=ON \
  -DWITH_IPP=ON \
  -DWITH_TBB=ON \
  -DWITH_EIGEN=ON \
  -DWITH_V4L=ON \
  -DBUILD_TESTS=OFF \
  -DBUILD_PERF_TESTS=OFF \
  -DCMAKE_BUILD_TYPE=RELEASE \
  .. \
&& make install \
&& rm /${OPENCV_VERSION}.zip \
&& rm -r /opencv-${OPENCV_VERSION}

WORKDIR /
RUN mkdir -p /CppND-Program-a-Concurrent-Traffic-Simulation
RUN mkdir -p /scripts
COPY ./scripts/build-project.sh /build-project.sh
