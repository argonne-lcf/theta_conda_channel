# theta_conda_channel
Files for building anaconda cloud packages for Theta.

# Building a package

Install a fresh miniconda version:
```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod a+x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh -b -p $(pwd -LP)/mconda3
```

Enter the base environment
```
eval "$(mcondna3/bin/conda shell.bash hook)"
```

You might need to install some things
```
conda install anaconda-client
```

Clone this repository and enter repo directory
```
conda-build cython/
```

The build will give you the path to the `*.tar.bz2` package file. Now you nneed to upload it
```
anaconda upload --user argonne-lcf <path/to/tar.bz2>
```

At this point it will ask for your password for anaconda cloud. You'll need to be associated with the organization to upload to it.


