# Masurca in Docker
![Build Badge](https://github.com/aakashsur/docker-masurca/actions/workflows/continuous-integration.yml/badge.svg)

[Masurca](https://github.com/alekseyzimin/masurca) is a popular hybrid genome assembler which is able to combine long read and short read data. Its installation procedure is non-trivial so I created this docker image to circumvent some of the issues I was having. Currently, it is running version 4.0.3 of Masurca. 

## Usage
After pulling the image, first a run script is generated by using the configuration file, then the run script can be executed to the container - 

```
docker pull \
  aakashsur/masurca
  
docker run \
  --rm \
  --volume $PWD:/root/results \
  --workdir /root/results \
  aakashsur/masurca \
  masurca \
  config.txt
  
docker run \
  --rm \
  --volume $PWD:/root/results \
  --workdir /root/results \
  aakashsur/masurca \
  ./assemble.sh
```

# Details

The `masurca` command has been placed in $PATH. Easiest way to run is to have everything in $PWD, i.e. config file, and the fastq files (hard link them if you don't want to move or copy them). The current local directory then gets mounted to the /root/results/ directory of the container. 

For running in an HPC setting, where singularity is often the choice of containerization - 

```
singularity pull \
  docker://aakashsur/masurca
  
singularity run 
  --bind $PWD:/root/results \
  --home /root/results \
  masurca_latest.sif \
  masurca \
  config.txt
  
singularity run 
  --bind $PWD:/root/results \
  --home /root/results \
  masurca_latest.sif \
  ./assemble.sh
```
