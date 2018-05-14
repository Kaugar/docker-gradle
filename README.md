# huli-spring
This is a docker image with contains java:8 and gradle environment, and a sample app. With it you can start your own java spring boot project on your machine, without installing the development environment. Just use your favourite IDE.

## Install docker
As Docker is highly scalable it can run on robust servers and on your PC too
provided it has 64bit architecture and OS, et least 4GB (**8GB is recomended**) of RAM, and hardware supported virtualization enabled (Check the Systeminfo, BIOS or UEFI for these informations)  

#### (please use the Stable version!)

### [Windows](https://docs.docker.com/docker-for-windows/install/)

### [Linux](https://github.com/DonBattery/Docker/blob/master/dockerguide.md)

### [Mac](https://docs.docker.com/docker-for-mac/)

## Pull the image from dockerhub:
```
docker pull laszlobrhlik/huli-spring:latest
```
### Clone the github repository

https://github.com/greenfox-academy/Huli/huli-spring-gradle

### run the sample app
Go inside the folder of the demo and run:
```
docker-compose up -d
```
Check your running conatiners with
```
docker ps
```
Step in your running gradle-container
```
docker exec -it gradle-container /bin/bash
```
make 'firstrun.sh' executable
```
chmod +x firstrun.sh
```
run 'firstrun.sh' to copy java spring gradle starter app to bind mounted volume
```
./firstrun.sh
```
Get into 'huli-spring' starter app
```
cd huli-spring
```
Run the tests
```
./gradlew test
```
Run the app
```
./gradlew bootRun
```

Now you can reach the RestApi at http://localhost:8080/hello

### In the cloned diretory on your machine you can reach the project files, you can open it with an editor and it will refresh your applicion the container.