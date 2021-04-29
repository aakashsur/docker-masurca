FROM debian:latest

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      wget \
      ca-certificates \
      make \
      gcc \
      g++ \
      zlib1g-dev \
      libbz2-dev \
      libboost-all-dev && \
    apt-get autoremove && \
    apt-get clean

# Building Samtools
RUN cd ~ && \
  wget https://github.com/alekseyzimin/masurca/releases/download/v4.0.3/MaSuRCA-4.0.3.tar.gz && \
  tar -xvzf MaSuRCA-4.0.3.tar.gz && \
  cd MaSuRCA-4.0.3 && \
  ./install.sh
  
ENV PATH="${PATH}:/root/MaSuRCA-4.0.3/bin"
