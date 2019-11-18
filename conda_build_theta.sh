#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

chmod a+x Miniconda3-latest-Linux-x86_64.sh

./Miniconda3-latest-Linux-x86_64.sh -b -p $1

export PATH=$1/bin:$PATH

conda install -y tensorflow=1.14 pytorch-cpu=1.2 mkl-dnn scipy pandas h5py virtualenv matplotlib scikit-learn 

conda install -y -c alcf-theta mpi4py horovod
