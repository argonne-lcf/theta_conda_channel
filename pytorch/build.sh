# build.sh for PyTorch
module () {
    eval `/opt/cray/pe/modules/3.2.11.3/bin/modulecmd bash $*`
}
set -x
set -e
echo "In build.sh..."
module load PrgEnv-gnu
module load gcc/8.3.0

module list

env
which cc
cc --version

echo "building Pytorch..."
export CMAKE_PREFIX_PATH=$PREFIX
export USE_MKLDNN=1
export CMAKE_GENERATOR=Ninja
echo cmake = $(which cmake)
$PYTHON setup.py build -g
$PYTHON setup.py install

