# Existing content of your Dockerfile
FROM dealii/dealii:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV PLAS_DIR=/plasticity

USER root

# Install dependencies including git, curl, and GCC 9
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    curl \
    libopenmpi-dev \
    openmpi-bin \
    software-properties-common && \
    add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt-get update && \
    apt-get install -y gcc-9 g++-9 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 60 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 60 && \
    apt-get install -y paraview && \
    rm -rf /var/lib/apt/lists/*

# Clone the PRISMS-Plasticity repository
RUN git clone https://github.com/prisms-center/plasticity.git $PLAS_DIR

# Build PRISMS-Plasticity
WORKDIR $PLAS_DIR
RUN cmake . && \
    make -j4

# Build the crystalPlasticity application
WORKDIR $PLAS_DIR/applications/crystalPlasticity
RUN cmake . && \
    make release

# Change ownership to dealii user
RUN chown -R dealii:dealii $PLAS_DIR

# Switch back to dealii user
USER dealii

CMD ["/bin/bash"]
