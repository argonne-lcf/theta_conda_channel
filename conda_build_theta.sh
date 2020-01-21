#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 INSTALL_DIRECTORY" >&2
  exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

wget -N https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

chmod a+x Miniconda3-latest-Linux-x86_64.sh

./Miniconda3-latest-Linux-x86_64.sh -b -p $1

export PATH=$1/bin:$PATH
conda_exe=$1/bin/conda

${conda_exe} install -y tensorflow=1.14 pytorch-cpu=1.2 mkl-dnn scipy pandas h5py virtualenv matplotlib scikit-learn
${conda_exe} install -y -c alcf-theta mpi4py horovod
