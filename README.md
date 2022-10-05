# Data Sci Environment Setup

This project sets up a local data science development environment in the browser.  

It builds a docker container including:  

  + Ubuntu 20.04 LTS  
  + `R` version 4.2  
  + RStudio Server 2022.02.3+492  
  + All `tidyverse` packages  and `devtools`  
  + `tex` & publishing-related package  

The image builds on the `rocker/verse` image from [Rocker Project](https://rocker-project.org/).   


## Setup  

### Step 1: Install Docker    

You will need Docker installed on your host machine. Go to https://docs.docker.com/get-docker/
for more details.  

### Step 2: Clone this repo   

[Clone](https://docs.github.com/en/get-started/getting-started-with-git/about-remote-repositories) this repository from Github 
or download as a .zip file and unpack locally.   

Then make this directory your working directory.    

The `rstudio-prefs.json` config file will load your preferences and layouts in RStudio. This can be replaced with your own 
version, which is usually found on your host machine at `~/.config/rstudio`.    


### Step 3: Build the image     

An automated build script has been included to build the container.   

```console
$ bash build_docker.sh
```

### Step 4: Run the container   

Once the build has finished run the following command.

Replace `$LOCAL_WORKING_DIRECTORY` with a file path to a local directory. This will be mounted as a volume to use within the container.    

```console
docker run --rm -ti -d -p 127.0.0.1:8787:8787 --name dsci-rstudio -v $LOCAL_WORKING_DIRECTORY:/home/rstudio/workspace dsci-rstudio:4.2
```

### Step 5: Use   

Navigate to: 

```
localhost:8787
```

or

```
127.0.0.1:8787
```
 
In the browser to open RStudio

![](img/rstd.png)

## Some helpful commands

### List Images  

```
docker images 
```

### List All Containers

```
docker ps -a
```
### Remove Containers  

For individual containers add the container ID
```
$ docker rm
```  
To remove all exited containers :  

```
$ docker rm $(docker ps -a -q -f status=exited)
```

### System Prune

Remove all unused containers, networks, images (both dangling and unreferenced), and optionally, volumes.  

```
docker system prune -a
```  

## Save as tar-archive  

```
docker save -o ~/myapp.tar myapp
``` 

## Load and Run Archive  

```
docker load -i myapp.tar
docker run myapp
```

## Acknowldegements  

Thanks to [Rami Krispin](https://github.com/RamiKrispin) and 
their tutorial on [Deploying Flex Actions](https://github.com/RamiKrispin/deploy-flex-actions) where much of the inspiration amnd code comes from.  

Thanks to the team at [The Rocker Project](https://rocker-project.org/)


## Licence  

This material is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. https://creativecommons.org/licenses/by-nc-sa/4.0/

