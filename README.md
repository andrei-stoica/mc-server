# Running a Minecraft server (spigot) inside of docker
This is a all in one setup to run a Spigot server using docker. It also includes
a systemd unit file for setting it up to run automaticaly.

## Requirements
- docker
- make
- curl

The server is configured to use up to 4 GB if ram. To change this you will need to edit the docker run commands in the Makefile and unit file.
> -Xms1G
 - minimum 1 GB of memory
> -Xmx4G
 - maximum 4 GB of memeory

## Warnings
All file permisions are handeled by docker, thus they will be owned by root on
the host filesystem.

## Building
> make build-latest
 - builds the latest version of of spigot
 
## deploying 
> make deploy
 - copies the latest build into the running directory

## Running
> make test
 - run a test instance of the server

### Systemd unit file (mc-server.service)
1. assumes the working directory to be `/mc`, change it on line 7
2. copy to systemd config folder (/etc/systemd/system/ on Ubuntu) 

> make up
 - start the systemd service

> make down
 - top the systemd service

