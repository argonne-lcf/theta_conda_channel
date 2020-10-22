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
#module load xalt
#module load trackdeps

module list

export CRAY_CPU_TARGET=mic-knl

#env
#which cc
#cc --version

echo Editing setup.py...
# mpi.cfg replacement
sed -i "s/def get_mpi_flags():/def get_mpi_flags():\n    return ''/g" setup.py
#sed -i "s/require_list =/require_list=\[\] #/g" setup.py
#sed -i "s/setup(name=/require_list=\[\]\nsetup(name=/g" setup.py

#grep -A 2 -B 2 get_mpi_flags setup.py
#grep -A 2 -B 2 require_list setup.py

# $PYTHON and $PREFIX will be set by conda-build
echo Building horovod...
export PYTHONPATH=$CONDA_PREFIX/lib/python3.7/site-packages
HOROVOD_WITH_TENSORFLOW=1 HOROVOD_WITH_PYTORCH=1 HOROVOD_WITHOUT_MXNET=1 CC=cc CXX=CC $PYTHON setup.py build
echo Installing horovod...
HOROVOD_WITH_TENSORFLOW=1 HOROVOD_WITH_PYTORCH=1 HOROVOD_WITHOUT_MXNET=1 CC=cc CXX=CC $PYTHON setup.py install --prefix=$PREFIX
