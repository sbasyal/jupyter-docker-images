#!/usr/bin/env bash

mkdir /tmp/build
cd /tmp/build

apt-get -y update
apt-get -y install git-core build-essential curl nano wget

curl https://bootstrap.pypa.io/get-pip.py | python2
curl https://bootstrap.pypa.io/get-pip.py | python3

# Install conda
export CONDA_DIR=/opt/conda

echo 'export PATH=$CONDA_DIR/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-3.9.1-Linux-x86_64.sh && \
    bash Miniconda3-3.9.1-Linux-x86_64.sh -b -p $CONDA_DIR && \
    rm Miniconda3-3.9.1-Linux-x86_64.sh && \
    $CONDA_DIR/bin/conda install --yes conda==3.10.1

export PATH=$CONDA_DIR/bin:$PATH

conda install --yes ipython-notebook terminado && conda clean -yt

# Download and install Anaconda for 2.7 and 3.4
curl -O https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.2.0-Linux-x86_64.sh 
curl -O https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda3-2.2.0-Linux-x86_64.sh 

bash Anaconda-2.2.0-Linux-x86_64.sh -b
bash Anaconda3-2.2.0-Linux-x86_64.sh -b

# Set PATH
export PATH="$HOME/anaconda/bin:$PATH"

# Reduce the image size
apt-get autoremove -y
apt-get clean -y

cd /
rm -rf /tmp/build