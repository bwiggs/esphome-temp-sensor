DEVICE=/dev/ttyUSB0
# tried podman, but there's something up with the --device rootless containers and groups.
# Might work with podman running crun?
# see more: https://github.com/containers/podman/issues/10166
CONTAINER_ENGINE=docker
CONTAINER=ghcr.io/esphome/esphome
ESPHOME=${CONTAINER_ENGINE} run --rm -ti --privileged -p 6052:6052 --device=${DEVICE} -v ${PWD}:/config ${CONTAINER}

dashboard:
	${ESPHOME}

install:
	${ESPHOME} run board.yaml
