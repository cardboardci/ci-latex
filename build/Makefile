include Makefile.metadata.variable
include Makefile.image.variable
include Makefile.user.variable

# Variables
#
# Common variables of the project.
VERSION ?= basic
DOCKER_IMAGE := ${REGISTRY}/${NAMESPACE}/${PROJECT}
DOCKER_TAG := $(VERSION)
DOCKER_ROOT := $(shell dirname $(shell pwd))

# Version variables
#
# Including variables for the versions.
DOCKER_VERSION := ../versions/$(VERSION)
ifeq ($(shell test -e $(DOCKER_VERSION) && echo -n yes),yes)
	include $(DOCKER_VERSION)
else
    $(error The file $(DOCKER_VERSION) could not be found.)
endif

# File System Variables
#
# Variables related to the file system paths.
DOCKER_DIR := ../src/.
DOCKERFILE := ../src/Dockerfile

.PHONY: debug baseimage privileged test clean prune pull push

all: build
default: build
release: build
build: debug baseimage privileged

debug:
	@echo Docker Image: $(DOCKER_IMAGE):$(DOCKER_TAG) [scheme = $(SCHEME)]

baseimage:
	docker build --pull \
		 -t ${DOCKER_IMAGE}:${DOCKER_TAG} \
		--build-arg BUILD_DATE="${BUILD_DATE}" \
		--build-arg VERSION="${CODE_VERSION}" \
		--build-arg VCS_REF="${GIT_COMMIT}" \
		--build-arg SCHEME="${SCHEME}" \
		--build-arg DUID="${DUID}" \
		--build-arg DGID="${DGID}" \
		--build-arg USER="docker" \
		-f ${DOCKERFILE} ${DOCKER_DIR} \

privileged:
	docker build --pull \
		 -t ${DOCKER_IMAGE}:${DOCKER_TAG}-privileged \
		--build-arg BUILD_DATE="${BUILD_DATE}" \
		--build-arg VERSION="${CODE_VERSION}" \
		--build-arg VCS_REF="${GIT_COMMIT}" \
		--build-arg SCHEME="${SCHEME}" \
		--build-arg DUID="${DUID}" \
		--build-arg DGID="${DGID}" \
		--build-arg USER="root" \
		-f ${DOCKERFILE} ${DOCKER_DIR} \

test:
	docker run --rm -v $(DOCKER_ROOT)/test:/media ${DOCKER_IMAGE}:${DOCKER_TAG} sh test.sh

clean:
	docker rmi --force ${DOCKER_IMAGE}:${DOCKER_TAG} || exit 0

prune:
	docker images -q -f dangling=true | xargs --no-run-if-empty docker rmi

pull:
	docker pull --all-tags ${DOCKER_IMAGE}

push:
	docker push ${DOCKER_IMAGE}

release:
	docker push ${DOCKER_IMAGE}:${DOCKER_TAG} || exit 0 
	docker push ${DOCKER_IMAGE}:${DOCKER_TAG}-privileged || exit 0