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
      libboost-all-dev \
      file \
      numactl && \
    apt-get autoremove && \
    apt-get clean

# Building Samtools
RUN cd ~ && \
  wget https://github.com/alekseyzimin/masurca/releases/download/v4.0.3/MaSuRCA-4.0.3.tar.gz && \
  tar -xvzf MaSuRCA-4.0.3.tar.gz && \
  rm MaSuRCA-4.0.3.tar.gz && \
  cd MaSuRCA-4.0.3 && \
  sed -i 's/ && cp -a ..\/Flye $DEST//' install.sh && \
  ./install.sh
  
ENV LC_ALL=C.UTF-8 \
    LANGUAGE=C.UTF-8 \
    LANG=C.UTF-8 \
    PATH="${PATH}:/root/MaSuRCA-4.0.3/bin"
