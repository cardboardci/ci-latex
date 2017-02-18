include Makefile.app.variable
include Makefile.metadata.variable
include Makefile.image.variable
include Makefile.user.variable

DOCKERFILE := src/.
TAG := latest

.PHONY: build clean prune push test pull

default: all

build:
	docker build \
		--build-arg BUILD_DATE="${BUILD_DATE}" \
		--build-arg VERSION="${VERSION}" \
		--build-arg VCS_REF="${VCS_REF}" \
		--build-arg SCHEME="${SCHEME}" \
		--pull -t ${FULL_NAME}:${APP_VERSION} ${DOCKERFILE}

test:
	docker run -v $(shell pwd)/test:/media ${FULL_NAME}:${TAG} sh test.sh

clean:
	docker rmi --force ${NAME}:${APP_VERSION} ${NAME}:latest || exit 0

prune:
	docker images -q -f dangling=true | xargs --no-run-if-empty docker rmi

pull:
	docker pull --all-tags ${FULL_NAME}

push:
	docker push ${FULL_NAME}

deploy:
	docker tag ${FULL_NAME}:${APP_VERSION} ${RELEASE}:${APP_VERSION}
	docker push ${RELEASE}

all: build