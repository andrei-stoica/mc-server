WORKING_DIR := $(shell pwd)

test:
	docker run -it --name mc-test -p 25565:25565 --rm -v $(WORKING_DIR)/spigot:/mc \
		-w /mc openjdk java -Xms1G -Xmx4G -server -jar spigot.jar nogui

up: 
	systemctl start mc-server.service

down:
	systemctl stop mc-server.service

include build/Makefile
