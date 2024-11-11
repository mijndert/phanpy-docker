VERSION := unknown

build:
	docker build --build-arg VERSION=${VERSION} -t phanpy-docker:${VERSION} -t phanpy-docker:latest .
