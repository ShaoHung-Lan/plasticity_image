# Plasticity Image

This project contains a Dockerfile to build a Docker image for PRISMS-Plasticity, a software package for modeling crystal plasticity.

## Prerequisite

Docker, Git, Paraview

## Dockerfile

The Dockerfile installs the necessary dependencies, clones the PRISMS-Plasticity repository, and builds the software.

### Included Software

- Deal.II
- GCC 9
- OpenMPI
- CMake
- Nano

## Building the Docker Image

To build the Docker image, run the following command:

```sh
docker build -t plasticity_image .
```

##  To build and save the docker image
```sh
docker build -t plasticity_image .
docker save -o ~/docker_projects/plasticity_image/plasticity_image.tar plasticity_image:latest
echo "Docker image saved as plasticity_image.tar"
```


## To load and run the docker image
```sh
docker load -i ~/docker_projects/plasticity_image/plasticity_image.tar
docker run -it plasticity_image:latest
```

## To commit and push changes to git
```sh

git add README.md
git commit -m "Update README.md with project details"
git push gitlab master

```


## To run the program
(should run under directory with BCinfo.txt, prm.prm,....For example: cd applications/CrystalPlasticity/fcc/compression)
```sh
mpirun -n 4 ../../main prm.prm
```
