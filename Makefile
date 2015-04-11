
NAME=phpmyadmin

build:
	docker build -t ${NAME} .

shell: build
	docker run -it --rm sh

test: build
	docker run --link mysql:mysql --rm -it -P ${NAME}

daemon: build
	docker run -d --name ${NAME} ${NAME}
