#ifndef LIBASM_BONUS_H
# define LIBASM_BONUS_H

#include <stdio.h>
#include <stdlib.h>

typedef struct s_list
{
	void *data;
	struct s_list *next;
} t_list;

int ft_atoi_base(char *arg1, char *arg2);
void ft_list_push_front(t_list **begin_list, void *data);
int ft_list_size(t_list *begin_list);
void ft_list_sort(t_list **begin_list, int (*cmp)());

void ft_atoi_base_tests();
void ft_list_push_front_tests();
void ft_list_size_tests();
void ft_list_sort_tests();

#endif