# Plasticity Image

This project contains a Dockerfile to build a Docker image for PRISMS-Plasticity, a software package for modeling crystal plasticity.

## Dockerfile

The Dockerfile installs the necessary dependencies, clones the PRISMS-Plasticity repository, and builds the software.

### Included Software

- Deal.II
- GCC 9
- OpenMPI
- CMake
- ParaView
- Nano

## Building the Docker Image

To build the Docker image, run the following command:

```sh
docker build -t plasticity_image .
```

##  To save the docker image
```sh
./save_image.sh
```


## To load and run the docker image
```sh
./load_image.sh
```


## To run the program
(should run under directory with BCinfo.txt, prm.prm,....For example: cd applications/CrystalPlasticity/fcc/compression)
```sh
mpirun -n 4 ../../main prm.prm
```
