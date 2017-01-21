IMAGE := $(shell cat IMAGE)

build:
	docker build --build-arg BUILD_DATE="$(shell date)" --build-arg VERSION="$(shell cat VERSION)" --pull -t ${IMAGE}:latest .
version:
    docker build --build-arg BUILD_DATE="$(shell date)" --build-arg VERSION="$(shell cat VERSION)" --build-arg SONEREZH_VERSION="${VERSION}" --pull -t ${IMAGE}:${VERSION} .
clean:
	docker rmi ${IMAGE}
rebuild: 
	docker rmi ${IMAGE}
	docker build -t ${IMAGE} .
push:
	docker push ${IMAGE}
all:
	build