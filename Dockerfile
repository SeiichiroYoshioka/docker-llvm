FROM alpine

RUN apk add --no-cache gcc libc-dev git ninja bash make cmake\
    && git clone https://github.com/llvm/llvm-project.git \
    && cd llvm-project \
    && mkdir build \
    && cd build \
    && cmake -G Ninja -DCMAKE_CXX_COMPILER=g++ \
       -DCMAKE_C_COMPILER=gcc \
       -DCMAKE_BUILD_TYPE="Release" \
       - DLLVM_ENABLE_PROJECTS="clang;libcxx;libcxxabi;lldb;lld" \
       -DLLVM_TARGETS_TO_BUILD="X86;RISCV;ARM" ../llvm \
    && cmake --build .

ENTRYPOINT [ "/bin/bash" ]