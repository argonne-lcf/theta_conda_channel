# build.sh for Cython
module () {
    eval `/opt/cray/pe/modules/3.2.11.3/bin/modulecmd bash $*`
}
set -x
set -e
echo "In build.sh..."
module load PrgEnv-gnu
module load gcc/8.3.0
module load cray-mpich

module list

env
which cc
cc --version

# $PYTHON and $PREFIX will be set by conda-build
echo "Building Cython..."
CC=cc CXX=CC $PYTHON setup.py build
CC=cc CXX=CC $PYTHON setup.py install --prefix=$PREFIX
