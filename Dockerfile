FROM ubuntu:20.04

WORKDIR /

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo 
ENV PATH=/usr/local/clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04/bin:$PATH

RUN apt update \
    && apt upgrade -y \
    && apt install -y ninja-build build-essential libncurses5 libxml2 wget \
    && apt install -y tzdata git \
    && wget https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz \
    && tar -Jxvf clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz \
    && cp -R clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04 /usr/local/ \
    && rm -rf clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04 \
    && rm -rf clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz


ENTRYPOINT ["/bin/bash"]