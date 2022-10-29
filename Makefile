# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jodufour <jodufour@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/28 13:07:43 by jodufour          #+#    #+#              #
#    Updated: 2022/10/28 18:25:23 by jodufour         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

######################################
#              COMMANDS              #
######################################
COMPOSE			=	docker compose --project-directory ${BASE_DIR}
SUDO			=	sudo --user=inception
MKDIR			=	mkdir -p
RM				=	rm -rf

#######################################
#             DIRECTORIES             #
#######################################
BASE_DIR		=	${PWD}/srcs
DATA_DIR		=	${HOME}/data
VOL_DIR			=	${addprefix ${DATA_DIR}/,	\
						vol_mariadb				\
						vol_wordpress			\
					}

#######################################
#                RULES                #
#######################################
.PHONY: build create start stop up down ps all clean fclean re fre

up: build create start

build create start stop down:
	${COMPOSE} $@

ps:
	${COMPOSE} $@ -a

all: up

clean:
	${COMPOSE} down --rmi all

fclean:
	${COMPOSE} down --rmi all --volumes
	${SUDO} ${RM} ${addsuffix /*, ${VOL_DIR}}

re: clean all

fre: fclean all

