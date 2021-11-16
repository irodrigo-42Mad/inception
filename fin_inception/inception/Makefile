# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: irodrigo <irodrigo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/15 11:25:25 by irodrigo          #+#    #+#              #
#    Updated: 2021/11/16 11:54:25 by irodrigo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#silence bash output &>/dev/null

#faltan los colores de make

# COLOUR DEFINITION #
BLUE = \033[0;34m
GREEN = \033[1;32m
RESET = \033[0m

all:
	@echo "$(BLUE)----- Generating images and directories ------$(RESET)"
	mkdir -p /sgoinfre/students/irodrigo/inception/data/mariadb/
	mkdir -p /sgoinfre/students/irodrigo/inception/data/wordpress/
	docker build -t service_nginx srcs/requirements/nginx/
	docker build -t service_mariadb srcs/requirements/mariadb/ 
	docker build -t service_wordpress srcs/requirements/wordpress/
	@echo "$(GREEN)----- finalizing process ------$(RESET)"
	@echo "$(BLUE)----- Running proyect ------$(RESET)"
	docker-compose -f srcs/docker-compose.yaml up -d

config:
	echo "127.0.0.1			irodrigo.42.fr">> /etc/hosts \
	&& echo "127.0.0.1		www.irodrigo.42.fr">> /etc/hosts

end:
	@echo "$(GREEN) --- Detaining process --- $(RESET)"
	docker stop $$(docker ps -q)
	@echo "$(GREEN) --- Deleting inactive containers --- $(RESET)"
	docker rm $$(docker ps -q -a)

prune:
	@echo "$(GREEN) --- Deleting docker images and volumes --- $(RESET)"
	docker system prune -f -a
	docker volume rm srcs_mariadb
	docker volume rm srcs_wordpress

nginx:
	docker exec -it nginx sh

wordpress:
	docker exec -it wordpress sh

mariadb:
	docker exec -it mariadb sh