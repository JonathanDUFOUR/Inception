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
COMPOSE_CMDS	=	up down build
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
.PHONY: all clean fclean re fre ${COMPOSE_CMDS} clear_volumes

all:

${COMPOSE_CMDS}:
	${COMPOSE} ${@}

clear_volumes:
	${SUDO} ${RM} ${addsuffix /*, ${VOL_DIR}}

clean: down

fclean: down clear_volumes

re: clean all

fre: fclean all

