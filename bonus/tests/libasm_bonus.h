#ifndef LIBASM_BONUS_H
# define LIBASM_BONUS_H

#include <stdio.h>

typedef struct s_list
{
	void *data;
	struct s_list *next;
} t_list;

int ft_atoi_base(char *arg1, char *arg2);
void ft_list_push_front(t_list **begin_list, void *data);

void ft_atoi_base_tests();

#endif