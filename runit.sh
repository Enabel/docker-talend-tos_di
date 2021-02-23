#!/bin/bash
if [[ -z "${IMAGE}" ]]; then
  IMAGE=enabelit/talend-tos_di
fi

docker run -vvvv -ti \
	--rm \
	--hostname talend-studio \
	--dns 8.8.8.8 \
	--volume /tmp/.X11-unix:/tmp/.X11-unix \
	--volume $(pwd)/talend:/home/talend \
	--env DISPLAY \
	--env XAUTH="$( xauth list $DISPLAY | sed -e 's/.*\(MIT.*\)/\1/' )" \
	--env UID=$(id -u) \
	--env GID=$(id -g) \
	--net=host \
	$IMAGE $@
