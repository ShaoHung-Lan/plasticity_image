#!/bin/bash
docker build -t plasticity_image .
docker save -o ~/docker_projects/plasticity_image/plasticity_image.tar plasticity_image:latest
echo "Docker image saved as plasticity_image.tar"
