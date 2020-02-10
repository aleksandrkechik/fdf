# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nsena <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/10/21 16:20:22 by nsena             #+#    #+#              #
#    Updated: 2019/11/01 15:02:14 by nsena            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COLOR_NONE = \e[0m
COLOR_WHITE = \e[1;37m
COLOR_BLUE = \e[1;34m
COLOR_GREEN = \e[1;32m
COLOR_PURPLE = \e[1;35m

NAME = fdf
CCFL = gcc -Wall -Wextra -Werror
SRC_PATH = ./src/
SRCS = $(SRC_PATH)check_color.c $(SRC_PATH)main.c $(SRC_PATH)main_loop1.c $(SRC_PATH)linear_alg.c $(SRC_PATH)renderer.c $(SRC_PATH)image.c $(SRC_PATH)landscape.c $(SRC_PATH)math.c $(SRC_PATH)read_map.c $(SRC_PATH)gnl.c $(SRC_PATH)ft_make_t_vector2.c $(SRC_PATH)ft_make_t_vector.c $(SRC_PATH)ft_destroy_t_vector.c $(SRC_PATH)read_map_2.c $(SRC_PATH)process_input.c $(SRC_PATH)linear_alg2.c $(SRC_PATH)landscape_2.c $(SRC_PATH)image_to_bmp.c $(SRC_PATH)image_to_bmp2.c $(SRC_PATH)tools1.c $(SRC_PATH)math2.c $(SRC_PATH)renderer2.c $(SRC_PATH)make_t_renderer.c $(SRC_PATH)t_main_loop_render_as_plane.c $(SRC_PATH)t_main_loop_render_as_sphere.c $(SRC_PATH)t_main_loop_render_as_sphere2.c $(SRC_PATH)make_t_main_loop.c $(SRC_PATH)t_main_loop_on_key.c $(SRC_PATH)main_loop2.c
OBJ = $(patsubst %.c,%.o,$(SRCS))
INCL = -Iincludes -Ilibft -Iminilibx_macos
FRAMEWORKS = -framework OpenGL -framework AppKit
LIBRARIES = -lft -lmlx -lm -L$(LIBFT_DIR) -L$(MINILIBX_DIR)
MINILIBX_DIR = ./minilibx_macos
MINILIBX_PATH = $(MINILIBX_DIR)/libmlx.a
LIBFT_DIR = ./libft
LIBFT_PATH = $(LIBFT_DIR)/libft.a

.PHONY: all clean fclean re

all: $(NAME)

$(NAME): $(MINILIBX_PATH) $(LIBFT_PATH) $(OBJ)
	@printf "$(COLOR_GREEN)Linking objects together...$(COLOR_NONE)\n"
	@$(CCFL) $(LIBRARIES) $(INCL) $(FRAMEWORKS) $(OBJ)
	@mv ./a.out $(NAME)

%.o: %.c
	@printf "$(COLOR_GREEN)Compiling $(COLOR_PURPLE)$<$(COLOR_GREEN) to $(COLOR_PURPLE)$@$(COLOR_GREEN)...$(COLOR_NONE)\n"
	@$(CCFL) $(INCL) $< -c -o $@

clean:
	@printf "$(COLOR_GREEN)Cleaning object files...$(COLOR_NONE)\n"
	@/bin/rm -f $(OBJ)
	@$(MAKE) -C $(MINILIBX_DIR) clean
	@$(MAKE) -C $(LIBFT_DIR) clean

$(MINILIBX_PATH):
	@printf "$(COLOR_GREEN)Compiling minilibx...$(COLOR_NONE)\n"
	@$(MAKE) -C $(MINILIBX_DIR)

$(LIBFT_PATH):
	@printf "$(COLOR_GREEN)Compiling libft...$(COLOR_NONE)\n"
	@$(MAKE) -C $(LIBFT_DIR)

fclean: clean
	@printf "$(COLOR_GREEN)Cleaning executable...$(COLOR_NONE)\n"
	@/bin/rm -f $(NAME)
	@/bin/rm -f $(MINILIBX_PATH)
	@$(MAKE) -C $(LIBFT_DIR) fclean

re: fclean $(NAME)
