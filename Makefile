IMAGE := $(shell cat IMAGE)

TAG=medium
TEXLIVE_SCHEME=scheme-medium

build:
	docker build --build-arg BUILD_DATE="$(shell date)" --build-arg VERSION="$(shell cat VERSION)" --build-arg SCHEME='${TEXLIVE_SCHEME}' --pull -t ${IMAGE}:${TAG} .
clean:
	docker rmi ${IMAGE}:${TAG}
rebuild: 
	clean build
push:
	docker push ${IMAGE}:${TAG}
all:
	build