WORKING_DIR := $(shell pwd)
.PHONY: deploy deploy-1.15.2 test up down 

deploy: spigot/spigot.jar

deploy-1.15.2: build/spigot-1.15.2.jar spigot
	cp build/spigot-1.15.2.jar spigot/spigot.jar


test:
	docker run -it --name mc-test -p 25565:25565 --rm -v $(WORKING_DIR)/spigot:/mc \
		-w /mc openjdk java -Xms1G -Xmx4G -server -jar spigot.jar nogui

up: 
	systemctl start mc-server.service

down:
	systemctl stop mc-server.service

include build/Makefile
