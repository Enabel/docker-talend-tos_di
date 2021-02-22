
# Talend Data Integration

Talend Open Studio for Data Integration on docker container

# What is Talend

Talend is an ETL

# How to use this image

This Talend container was built to automatically start a Talend TOS_DI IDE.
For this to work we must pass a number of variables/files unto the Docker so it
can connect to the X11 server.

    docker run -it \
    	--dns 8.8.8.8 \
    	--volume /tmp/.X11-unix:/tmp/.X11-unix \
    	--volume $(pwd)/talend:/home/talend \
		--env DISPLAY \
		--env XAUTH="$( xauth list $DISPLAY | sed -e 's/.*\(MIT.*\)/\1/' )" \
		--env UID=$(id -u) \
		--env GID=$(id -g) \
		--net=host \
		enabelit/talend-tos_di:7.3.1

## Configuration

ENVIRONMENT VARIABLES (only available with `docker run`)

 * `DISPLAY` - Your X11 DISPLAY environment variable
 * `UID`     - Your user ID
 * `GID`     - Your group ID
 * `XAUTH`   - Your X11 XAUTH magic cookie
 * `TZ`      - Your timezone env

### Setting the Timezone

Using `environment variables`

    docker run -it -e TZ=CET

# Build this Docker

You may use this command:

	docker build \
		--tag=enabelit/talend-tos_di:7.3.1 \
		.

But the download of the TOS_DI image make take a long while, in which case you may want to run buildit.sh instead which
will download the TOS_DI (and dependencies) once only and use them each time to build the docker.
