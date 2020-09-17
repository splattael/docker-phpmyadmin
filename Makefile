
NAME=phpmyadmin
VERSION=5.0.2

build:
	docker build -t ${NAME}:${VERSION} -t ${NAME}:latest .

shell: build
	docker run -it --rm ${NAME} sh

test: build
	docker run --net backend --env-file .testenv --rm -P ${NAME}

daemon: build
	docker run -d --name ${NAME} ${NAME}

release:
	git commit -av -e -m "Upgrade to phpMyAdmin ${VERSION}" && \
	git tag -f ${VERSION} && \
	git push && \
	git push --tags -f
