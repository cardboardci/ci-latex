IMAGE := jrbeverly/latex
TAG=latest
VERSION=0.2.0

build:
	docker build --build-arg BUILD_DATE="$(shell date)" --build-arg VERSION="$(shell cat VERSION)" --build-arg SCHEME="scheme-medium" --pull -t ${IMAGE}:${TAG} .
clean:
	docker rmi ${IMAGE}:${TAG}
rebuild: 
	clean build
push:
	docker push ${IMAGE}:${TAG}
all:
	build