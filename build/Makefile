LATEST := $(shell ls -rt build/spigot*.jar | tail -1)

spigot/spigot.jar: build-latest spigot
	cp $(LATEST) spigot/spigot.jar

build-latest: build-image
	docker run -it --rm -v $(WORKING_DIR)/build:/mc -w /mc java-build java -cp /mc \
		-jar BuildTools.jar

build/spigot-1.15.2.jar: build-image
	docker run -it --rm -v $(WORKING_DIR)/build:/mc -w /mc java-build java -cp /mc \
		-jar BuildTools.jar --rev 1.15.2

build-image: build/BuildTools.jar
	docker build -t java-build build/

build/BuildTools.jar:
	curl -o build/BuildTools.jar \
		https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

spigot:
	mkdir spigot
