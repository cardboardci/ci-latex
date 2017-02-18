include Makefile.app.variable
include Makefile.metadata.variable
include Makefile.image.variable
include Makefile.user.variable

DOCKERFILE := src/.

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
		--pull -t ${FULL_NAME}:${APP_VERSION} ${DOCKERFILE}

privileged:
	docker build \
		--build-arg BUILD_DATE="${BUILD_DATE}" \
		--build-arg VERSION="${VERSION}" \
		--build-arg VCS_REF="${VCS_REF}" \
		--build-arg SCHEME="${SCHEME}" \
		--build-arg DUID="${DUID}" \
		--build-arg DGID="${DGID}" \
		--build-arg USER="root" \
		--pull -t ${FULL_NAME}:${APP_VERSION}-privileged ${DOCKERFILE}

test:
	docker run -v $(shell pwd)/test:/media ${FULL_NAME}:${APP_VERSION} sh test.sh

clean:
	docker rmi --force ${NAME}:${APP_VERSION} ${NAME}:${APP_VERSION}-privileged  || exit 0

prune:
	docker images -q -f dangling=true | xargs --no-run-if-empty docker rmi

get:
	docker pull ${FULL_NAME}:${APP_VERSION}

pull:
	docker pull --all-tags ${FULL_NAME}

push:
	docker push ${FULL_NAME}

deploy:
	docker tag ${FULL_NAME}:${APP_VERSION} ${RELEASE}:${APP_VERSION}
	docker tag ${FULL_NAME}:${APP_VERSION}-privileged ${RELEASE}:${APP_VERSION}-privileged
	docker push ${RELEASE}

all: baseimage