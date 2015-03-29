
NAME=phpmyadmin

build:
	docker build -t ${NAME} .

shell: build
	docker run -it --rm -u root ${NAME} sh

test: build
	docker run --link mysql:mysql --name ${NAME} --rm -it -P ${NAME}

daemon: build
	docker run -d --name ${NAME} ${NAME}
