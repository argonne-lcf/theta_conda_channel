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

export CRAY_CPU_TARGET=mic-knl

env
which cc
cc --version

echo Editing mpi.cfg...
# mpi.cfg replacement
sed -i "s/## mpicc .*/mpicc = cc/g" mpi.cfg
sed -i "s/## mpicxx .*/mpicxx = CC/g" mpi.cfg

cat mpi.cfg

# $PYTHON and $PREFIX will be set by conda-build
echo Building mpi4py...
CC=cc CXX=CC $PYTHON setup.py build
CC=cc CXX=CC $PYTHON setup.py install --prefix=$PREFIX
