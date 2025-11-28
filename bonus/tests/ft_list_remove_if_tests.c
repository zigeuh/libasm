#include "libasm_bonus.h"
#include "libasm.h"

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

static void free_fct(void *data) {
    printf("Data: %p\n", data);
    printf("Data text: %s\n", (char*)data);
    free(data);
}

void ft_list_remove_if_tests() {

    printf("##############################################\n");
    printf("#              ft_list_remove_if             #\n");
    printf("##############################################\n");

    t_list *list = NULL;
    ft_list_remove_if(&list, "1", ft_strcmp, free_fct);

    ft_list_push_front(&list, ft_strdup("Hello"));
    ft_list_push_front(&list, ft_strdup("1"));
    ft_list_push_front(&list, ft_strdup("OtherFront"));
    ft_list_push_front(&list, ft_strdup("OtherFront2"));

    print_list(&list);


    ft_list_remove_if(&list, "1", ft_strcmp, free_fct);

    print_list(&list);
    free_list(&list);

    printf("\n");
}