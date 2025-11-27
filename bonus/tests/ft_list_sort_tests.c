#include "libasm_bonus.h"
#include "libasm.h"

static void print_list(t_list **begin) {
    t_list *list = (*begin);
    while (list != NULL) {
        printf("%s\n", (char*)list->data);
        list = list->next;
    }
}

static void list_sort(t_list **begin_list, int (*cmp)()) {
    t_list *current;
    void   *tmp;
    int swapped;

    if (!begin_list || !*begin_list)
        return;

    swapped = 1;
    while (swapped) {
        swapped = 0;
        current = *begin_list;
        while (current->next) {
            if (cmp(current->data, current->next->data) > 0) {
                tmp = current->data;
                current->data = current->next->data;
                current->next->data = tmp;
                swapped = 1;
            }
            current = current->next;
        }
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

void ft_list_sort_tests() {

    printf("##############################################\n");
    printf("#                ft_list_sort                #\n");
    printf("##############################################\n");

    printf("\n1. Already init list:\n");

    t_list *list = NULL;
    ft_list_push_front(&list, "5");
    ft_list_push_front(&list, "1");
    ft_list_push_front(&list, "3");
    ft_list_push_front(&list, "4");
    ft_list_push_front(&list, "6");

    print_list(&list);

    list_sort(&list, ft_strcmp);

    printf("--\n");
    print_list(&list);

    free_list(&list);
    printf("-------\n");

    list = NULL;
    ft_list_push_front(&list, "5");
    ft_list_push_front(&list, "1");
    ft_list_push_front(&list, "3");
    ft_list_push_front(&list, "4");
    ft_list_push_front(&list, "6");

    print_list(&list);

    ft_list_sort(&list, ft_strcmp);

    printf("--\n");
    print_list(&list);

    free_list(&list);

    printf("\n");
}