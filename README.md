# `theta_conda_channel`
Files for building anaconda cloud packages for Theta.
Misha Salim and Taylor Childers.

## Building a package

Install a fresh miniconda version:
```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod a+x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh -b -p $(pwd -LP)/mconda3
```

Enter the base environment:
```
eval "$(mconda3/bin/conda shell.bash hook)"
```

You might need to install some things:
```
conda install anaconda-client
conda install conda-build conda-verify
```

Clone this repository and enter repo directory:
```
conda-build cython/
```

The build will give you the path to the `*.tar.bz2` package file, e.g. `mconda/conda-bld/linux-64/cython-0.29.14-py37_0.tar.bz2`. Now you need to upload it:
```
anaconda upload --user argonne-lcf <path/to/tar.bz2>
```

At this point it will ask for your password for anaconda cloud. You'll need to be associated with the organization to upload to it.

## Building a Python environment on Theta

Simply run the script `conda_build_theta.sh <path/where/you/want/conda/installed>` and it will build an environment for machinne learning codes including a working version of Horovod and mpi4py. Activate the environment simply with `export PATH=<path/where/you/want/conda/installed>:$PATH`


