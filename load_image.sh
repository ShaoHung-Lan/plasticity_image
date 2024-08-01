#!/bin/bash
docker load -i ~/docker_projects/plasticity_image/plasticity_image.tar
docker run -it plasticity_image:latest
