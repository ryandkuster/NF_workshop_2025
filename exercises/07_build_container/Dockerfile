FROM debian:12.2

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      git-all \
      ca-certificates \
      make \
      gcc \
      g++ \
      zlib1g-dev \
      libbz2-dev \
      libboost-all-dev \
      binutils \
      xxd \
      procps

RUN cd ~ && \
  git clone https://github.com/alexdobin/STAR.git && \
  cd STAR/source && \
  make STAR && \
  mv STAR /usr/local/bin
