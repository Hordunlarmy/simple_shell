#include "leak_hunter.h"

#undef fmalloc
#undef free

char *my_strdup(const char *str)
{
	size_t len = strlen(str) + 1;
	char *new_str = malloc(len);

	if (new_str != NULL)
	{
		memcpy(new_str, str, len);
	}
	return (new_str);
}

t_list *lstlast(t_list *lst)
{
	if (!lst)
		return (lst);
	while (lst->next)
		lst = lst->next;
	return (lst);
}

void lstadd_back(t_list **alst, t_list *neww)
{
	neww->next = NULL;
	if (!(*alst))
		*alst = neww;
	else
		lstlast(*alst)->next = neww;
}

t_list *create_node(void *address, size_t size, size_t line, char *file)
{
	t_list	*new;

	new = (t_list *)malloc(sizeof(t_list));

	if (!new)
		return (NULL);
	new->address = address;
	new->size = size;
	new->line = line;
	new->file = my_strdup(file);
	new->next = NULL;
	return (new);
}

void delete_node(t_list **head, void *key)
{
	t_list *tmp, *prev;

	tmp = *head;
	if (tmp != NULL && tmp->address == key)
	{
		*head = tmp->next;
		free(tmp->file);
		free(tmp);
		return;
	}
	while (tmp != NULL && tmp->address != key)
	{
		prev = tmp;
		tmp = tmp->next;
	}
	if (tmp == NULL)
		return;
	prev->next = tmp->next;
	free(tmp);
}
