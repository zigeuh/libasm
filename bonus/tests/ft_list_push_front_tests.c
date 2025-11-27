#include "libasm_bonus.h"

static void print_list(t_list **begin) {
    t_list *list = (*begin);
    while (list != NULL) {
        printf("%s\n", (char*)list->data);
        list = list->next;
    }
}

static void free_list(t_list **begin) {
    t_list *list = (*begin);
    while (list != NULL) {
        t_list *temp = list;
        list = list->next;
        free(temp);
    }
}

static t_list *create_node() {
    t_list *new = malloc(sizeof(t_list));

    new->data = NULL;
    new->next = NULL;

    return new;
}

void ft_list_push_front_tests() {

    printf("##############################################\n");
    printf("#             ft_list_push_front             #\n");
    printf("##############################################\n");

    printf("\n1. Already init list:\n");

    t_list *list = malloc(sizeof(t_list));
    list->data = "Hello";
    list->next = create_node();
    list->next->data = "test";

    ft_list_push_front(&list, "Test1");
    ft_list_push_front(&list, "Test2");
    ft_list_push_front(&list, "FRONT");
    ft_list_push_front(&list, "FrontAgain");
    
    print_list(&list);
    free_list(&list);

    printf("\n2. Not init list:\n");

    list = NULL;
    ft_list_push_front(&list, "OtherTest1");
    ft_list_push_front(&list, "OtherTest2");
    ft_list_push_front(&list, "OtherFRONT");
    ft_list_push_front(&list, "OtherFrontAgain");

    print_list(&list);
    free_list(&list);

    printf("\n");
}