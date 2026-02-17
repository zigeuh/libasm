#include "libasm_bonus.h"
#include "libasm.h"

static void print_list(t_list **begin) {
    t_list *list = (*begin);
    while (list != NULL) {
        printf("%s\n", (char*)list->data);
        list = list->next;
    }
}

static void free_fct(void *data) {
    printf("Entering free_fct\n");
    printf("Data text: %s\n", (char*)data);
    free(data);
    printf("Free'd\n");
}

void ft_list_remove_if_tests() {

    printf("##############################################\n");
    printf("#              ft_list_remove_if             #\n");
    printf("##############################################\n");

    t_list *list = NULL;
    ft_list_remove_if(&list, "1", ft_strcmp, free_fct);

    ft_list_push_front(&list, ft_strdup("OtherFront"));
    ft_list_push_front(&list, ft_strdup("1"));
    ft_list_push_front(&list, ft_strdup("OtherFront2"));
    ft_list_push_front(&list, ft_strdup("Hello"));
    
    print_list(&list);

    printf("next: %p\n", list->next);
    printf("next next: %p\n", list->next->next);
    printf("next next next: %p\n", list->next->next->next);
    printf("next next next next: %p\n", list->next->next->next->next);
    ft_list_remove_if(&list, "1", ft_strcmp, free_fct);

    print_list(&list);
    printf("\n");
}