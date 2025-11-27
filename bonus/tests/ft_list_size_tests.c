#include "libasm_bonus.h"

static int list_size(t_list *begin_list) {
    int i = 0;
    while (begin_list != NULL) {
        i++;
        begin_list = begin_list->next;  
    }
    return (i);
}

static void free_list(t_list **begin) {
    t_list *list = (*begin);
    while (list != NULL) {
        t_list *temp = list;
        list = list->next;
        free(temp);
    }
}

void ft_list_size_tests() {

    printf("##############################################\n");
    printf("#             ft_list_push_front             #\n");
    printf("##############################################\n");

    printf("\n1. Normal list:\n");

    t_list *list = NULL;

    ft_list_push_front(&list, "8");
    ft_list_push_front(&list, "7");
    ft_list_push_front(&list, "6");
    ft_list_push_front(&list, "5");
    ft_list_push_front(&list, "4");
    ft_list_push_front(&list, "3");
    ft_list_push_front(&list, "2");
    ft_list_push_front(&list, "1");

    printf("ft_list_size: %d\n", ft_list_size(list));
    printf("list_size: %d\n", list_size(list));
    
    free_list(&list);

    printf("\n1. Long list:\n");

    list = NULL;

    ft_list_push_front(&list, "10");
    ft_list_push_front(&list, "9");
    ft_list_push_front(&list, "8");
    ft_list_push_front(&list, "7");
    ft_list_push_front(&list, "6");
    ft_list_push_front(&list, "5");
    ft_list_push_front(&list, "4");
    ft_list_push_front(&list, "3");
    ft_list_push_front(&list, "2");
    ft_list_push_front(&list, "1");
    ft_list_push_front(&list, "10");
    ft_list_push_front(&list, "9");
    ft_list_push_front(&list, "8");
    ft_list_push_front(&list, "7");
    ft_list_push_front(&list, "6");
    ft_list_push_front(&list, "5");
    ft_list_push_front(&list, "4");
    ft_list_push_front(&list, "3");
    ft_list_push_front(&list, "2");
    ft_list_push_front(&list, "1");
    ft_list_push_front(&list, "10");
    ft_list_push_front(&list, "9");
    ft_list_push_front(&list, "8");
    ft_list_push_front(&list, "7");
    ft_list_push_front(&list, "6");
    ft_list_push_front(&list, "5");
    ft_list_push_front(&list, "4");
    ft_list_push_front(&list, "3");
    ft_list_push_front(&list, "2");
    ft_list_push_front(&list, "1");
    ft_list_push_front(&list, "10");
    ft_list_push_front(&list, "9");
    ft_list_push_front(&list, "8");
    ft_list_push_front(&list, "7");
    ft_list_push_front(&list, "6");
    ft_list_push_front(&list, "5");
    ft_list_push_front(&list, "4");
    ft_list_push_front(&list, "3");
    ft_list_push_front(&list, "2");
    ft_list_push_front(&list, "1");
    ft_list_push_front(&list, "10");
    ft_list_push_front(&list, "9");
    ft_list_push_front(&list, "8");
    ft_list_push_front(&list, "7");
    ft_list_push_front(&list, "6");
    ft_list_push_front(&list, "5");
    ft_list_push_front(&list, "4");
    ft_list_push_front(&list, "3");
    ft_list_push_front(&list, "2");
    ft_list_push_front(&list, "1");
    ft_list_push_front(&list, "10");
    ft_list_push_front(&list, "9");
    ft_list_push_front(&list, "8");
    ft_list_push_front(&list, "7");
    ft_list_push_front(&list, "6");
    ft_list_push_front(&list, "5");
    ft_list_push_front(&list, "4");
    ft_list_push_front(&list, "3");
    ft_list_push_front(&list, "2");
    ft_list_push_front(&list, "1");
    ft_list_push_front(&list, "10");
    ft_list_push_front(&list, "9");
    ft_list_push_front(&list, "8");
    ft_list_push_front(&list, "7");
    ft_list_push_front(&list, "6");
    ft_list_push_front(&list, "5");
    ft_list_push_front(&list, "4");
    ft_list_push_front(&list, "3");
    ft_list_push_front(&list, "2");
    ft_list_push_front(&list, "1");
    ft_list_push_front(&list, "10");
    ft_list_push_front(&list, "9");
    ft_list_push_front(&list, "8");
    ft_list_push_front(&list, "7");
    ft_list_push_front(&list, "6");
    ft_list_push_front(&list, "5");
    ft_list_push_front(&list, "4");
    ft_list_push_front(&list, "3");
    ft_list_push_front(&list, "2");
    ft_list_push_front(&list, "1");
    ft_list_push_front(&list, "10");
    ft_list_push_front(&list, "9");
    ft_list_push_front(&list, "8");
    ft_list_push_front(&list, "7");
    ft_list_push_front(&list, "6");
    ft_list_push_front(&list, "5");
    ft_list_push_front(&list, "4");
    ft_list_push_front(&list, "3");
    ft_list_push_front(&list, "2");
    ft_list_push_front(&list, "1");
    ft_list_push_front(&list, "10");
    ft_list_push_front(&list, "9");
    ft_list_push_front(&list, "8");
    ft_list_push_front(&list, "7");
    ft_list_push_front(&list, "6");
    ft_list_push_front(&list, "5");
    ft_list_push_front(&list, "4");
    ft_list_push_front(&list, "3");
    ft_list_push_front(&list, "2");
    ft_list_push_front(&list, "1");
    ft_list_push_front(&list, "10");
    ft_list_push_front(&list, "9");
    ft_list_push_front(&list, "8");
    ft_list_push_front(&list, "7");
    ft_list_push_front(&list, "6");
    ft_list_push_front(&list, "5");
    ft_list_push_front(&list, "4");
    ft_list_push_front(&list, "3");
    ft_list_push_front(&list, "2");
    ft_list_push_front(&list, "1");
    ft_list_push_front(&list, "10");
    ft_list_push_front(&list, "9");
    ft_list_push_front(&list, "8");
    ft_list_push_front(&list, "7");
    ft_list_push_front(&list, "6");
    ft_list_push_front(&list, "5");
    ft_list_push_front(&list, "4");
    ft_list_push_front(&list, "3");
    ft_list_push_front(&list, "2");
    ft_list_push_front(&list, "1");

    printf("ft_list_size: %d\n", ft_list_size(list));
    printf("list_size: %d\n", list_size(list));
    
    free_list(&list);

    printf("\n");
}