#include "libasm_bonus.h"
#include "libasm.h"

static void print_list(t_list **begin) {
    t_list *list = (*begin);
    while (list != NULL) {
        printf("%s\n", (char*)list->data);
        list = list->next;
    }
}

// static void list_sort(t_list **begin_list, int (*cmp)()) {
//     t_list *current;
//     void   *tmp;
//     int swapped;

//     if (!begin_list || !*begin_list)
//         return;

//     swapped = 1;
//     while (swapped) {
//         swapped = 0;
//         current = *begin_list;
//         while (current->next) {
//             if (cmp(current->data, current->next->data) > 0) {
//                 tmp = current->data;
//                 current->data = current->next->data;
//                 current->next->data = tmp;
//                 swapped = 1;
//             }
//             current = current->next;
//         }
//     }
// }


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

    printf("\n1. Random normal list:\n");

    t_list *list1 = NULL;
    ft_list_push_front(&list1, "5");
    ft_list_push_front(&list1, "1");
    ft_list_push_front(&list1, "3");
    ft_list_push_front(&list1, "4");
    ft_list_push_front(&list1, "6");

    printf("Before:\n");
    print_list(&list1);

    printf("After:\n");
    ft_list_sort(&list1, ft_strcmp);
    print_list(&list1);

    free_list(&list1);

    printf("\n2. Empty list:\n");

    list1 = NULL;

    printf("Before:\n");
    print_list(&list1);

    printf("After:\n");
    ft_list_sort(&list1, ft_strcmp);
    print_list(&list1);

    printf("\n3. NULL arg:\n");

    ft_list_sort(NULL, ft_strcmp);

    printf("\n4. NULL func:\n");

    ft_list_push_front(&list1, "5");
    ft_list_push_front(&list1, "1");
    ft_list_push_front(&list1, "3");
    ft_list_push_front(&list1, "4");
    ft_list_push_front(&list1, "6");

    printf("Before:\n");
    print_list(&list1);

    printf("After:\n");
     ft_list_sort(&list1, NULL);
    print_list(&list1);

    free_list(&list1);

    printf("\n5. Already sorted list:\n");

    list1 = NULL;

    ft_list_push_front(&list1, "5");
    ft_list_push_front(&list1, "4");
    ft_list_push_front(&list1, "3");
    ft_list_push_front(&list1, "2");
    ft_list_push_front(&list1, "1");

    printf("Before:\n");
    print_list(&list1);

    printf("After:\n");
    ft_list_sort(&list1, ft_strcmp);
    print_list(&list1);

    free_list(&list1);

    printf("\n6. One node list:\n");

    list1 = NULL;

    ft_list_push_front(&list1, "5");

    printf("Before:\n");
    print_list(&list1);

    printf("After:\n");
    ft_list_sort(&list1, ft_strcmp);
    print_list(&list1);

    free_list(&list1);

    printf("\n6. Two node list:\n");

    list1 = NULL;

    ft_list_push_front(&list1, "4");
    ft_list_push_front(&list1, "5");

    printf("Before:\n");
    print_list(&list1);

    printf("After:\n");
     ft_list_sort(&list1, ft_strcmp);
    print_list(&list1);

    free_list(&list1);

    printf("\n");
}