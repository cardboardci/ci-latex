include Makefile.app.variable
include Makefile.metadata.variable
include Makefile.image.variable
include Makefile.user.variable

DOCKERFILE := src/.

CONTAINER := ${FULL_NAME}:${APP_VERSION}
CONTAINER_ROOT := ${FULL_NAME}:${APP_VERSION}-privileged

.PHONY: baseimage privileged clean prune push test pull

default: all

baseimage:
	docker build \
		--build-arg BUILD_DATE="${BUILD_DATE}" \
		--build-arg VERSION="${VERSION}" \
		--build-arg VCS_REF="${VCS_REF}" \
		--build-arg SCHEME="${SCHEME}" \
		--build-arg DUID="${DUID}" \
		--build-arg DGID="${DGID}" \
		--build-arg USER="docker" \
		--pull -t ${CONTAINER} ${DOCKERFILE}

privileged:
	docker build \
		--build-arg BUILD_DATE="${BUILD_DATE}" \
		--build-arg VERSION="${VERSION}" \
		--build-arg VCS_REF="${VCS_REF}" \
		--build-arg SCHEME="${SCHEME}" \
		--build-arg DUID="${DUID}" \
		--build-arg DGID="${DGID}" \
		--build-arg USER="root" \
		--pull -t ${CONTAINER_ROOT} ${DOCKERFILE}

test:
	docker run -v $(shell pwd)/test:/media ${CONTAINER} sh test.sh

clean:
	docker rmi --force ${CONTAINER} ${CONTAINER_ROOT} || exit 0

prune:
	docker images -q -f dangling=true | xargs --no-run-if-empty docker rmi

get:
	docker pull ${CONTAINER}

pull:
	docker pull ${CONTAINER}
	docker pull ${CONTAINER_ROOT}

push:
	docker push ${FULL_NAME}

deploy:
	docker tag ${CONTAINER} ${RELEASE}:${APP_VERSION}
	docker tag ${CONTAINER_ROOT} ${RELEASE}:${APP_VERSION}-privileged
	docker push ${RELEASE}

all: baseimage privileged