# Get Ubuntu 16.04 System
FROM ubuntu:xenial

# Install fortran and C compiler
RUN apt-get update \
 && apt-get install -y wget \
 && apt install gcc -y \
 && apt install gfortran -y \
 && apt install make -y 
 
## get GRACE system package and Unzip
RUN wget http://minami-home.kek.jp/grace221/grace.221.2006.0116.tgz

RUN tar -xvzf grace.221.2006.0116.tgz \
 && mv grace.2.2* grace && rm grace.221.2006.0116.tgz

## Setup environment System
RUN cd grace \
 && ./Config.sh \
 && sed -i 's/FC        = fort/FC        = gfortran/g' Makefile \
 && make -n \
 && make -n install \
 && make \
 && make install \
 && make test-install

## Remove update history
RUN rm -rf /var/lib/apt/lists/*

## Add Environment GRACE
ENV PATH="${PATH}:/grace/bin"
