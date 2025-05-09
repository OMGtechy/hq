FROM alpine:3.21

# Install packages
RUN apk add \
    bash \
    clang \
    git \
    gcc \
    g++ \
    lld \
    mold \
    rust \
    vim \
    ;

# Sanity checks
COPY ./test/ /tmp/test
RUN g++ /tmp/test/simple.cpp -std=c++23 -o /tmp/test/simple-gcc && /tmp/test/simple-gcc
RUN clang++ /tmp/test/simple.cpp -std=c++23 -o /tmp/test/simple-clang && /tmp/test/simple-clang
RUN rustc /tmp/test/simple.rs -o /tmp/test/simple-rustc && /tmp/test/simple-rustc

ENTRYPOINT [ "/bin/bash" ]
