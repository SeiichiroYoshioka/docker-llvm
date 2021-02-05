FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo 

RUN apt update \
    && apt upgrade -y \
    && apt install -y cmake Ninja build-essential \
    && apt install -y tzdata git \
    && git clone https://github.com/llvm/llvm-project.git \
    && cd llvm-project \
    && mkdir build \
    && cd build \
    && cmake -G Ninja -DCMAKE_CXX_COMPILER=/usr/bin/g++ \
       -DCMAKE_C_COMPILER=/usr/bin/gcc \
       -DCMAKE_BUILD_TYPE="Release" \
       -DLLVM_ENABLE_PROJECTS="clang;libcxx;libcxxabi;lldb;lld" \
       -DLLVM_TARGETS_TO_BUILD="X86;RISCV;ARM" ../llvm \
    && cmake --build .

ENTRYPOINT [ "/bin/bash" ]