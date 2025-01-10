FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    wget \
    bzip2 \
	git \
    bash && \
    rm -rf /var/lib/apt/lists/*  # Clean up apt cache to reduce image size

RUN mkdir -p /miniconda3 && \
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh -O /miniconda3/miniconda.sh && \
    bash /miniconda3/miniconda.sh -b -u -p /miniconda3 && \
    rm /miniconda3/miniconda.sh

ENV PATH="/miniconda3/bin:${PATH}"

RUN git clone https://github.com/dbarnett/python-helloworld.git