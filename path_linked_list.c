#include <stdio.h>
#include "main.h"
/**
 * link_path - is a function that creates a linked list for the path
 * Return: a pointer to the first node
 */
linked_path *link_path(void)
{
	char *token;
	char *Path;
	linked_path *head;
	linked_path *current_node = (linked_path *)malloc(sizeof(linked_path));

	head = current_node;


	Path = _getenv("PATH");
	token = strtok(Path, ":\n");
	current_node->dir = token;

	while (token != NULL)
	{
		token = strtok(NULL, ":\n");
		if (token != NULL)
		{
			current_node->next = (linked_path *)malloc(sizeof(linked_path));
			current_node = current_node->next;
			current_node->dir = token;
		}
	}
	current_node->next = NULL;

	return (head);

}
