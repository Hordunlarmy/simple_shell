#include <stdio.h>
#include "main.h"
/**
 * link_path - is a function that creates a linked list for the path
 * Return: a pointer to the first node
 */
linked_path *link_path(void)
{
	char *dir;
	char *Path;
	char *Path_dup;
	linked_path *head;
	linked_path *current_node = (linked_path *)malloc(sizeof(linked_path));

	head = current_node;


	Path = _getenv("PATH");
	Path_dup = strdup(Path);
	dir = str_tok(Path_dup, ":");
	current_node->dir = strdup(dir);

	while (dir != NULL)
	{
		dir = str_tok(NULL, ":");
		if (dir != NULL)
		{
			current_node->next = (linked_path *)malloc(sizeof(linked_path));
			current_node = current_node->next;
			current_node->dir = strdup(dir);
		}
	}
	current_node->next = NULL;

	return (head);

}
