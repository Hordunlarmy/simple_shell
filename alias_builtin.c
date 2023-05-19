#include "main.h"
/**
 * check_alias - is a function that check if an alias exist
 * @args: is a list of arguments
 * return: Name of alias if success or NULL if not
 */
char *check_alias(char *new)
{
	alias *temp = alias_list;

	while (temp != NULL)
	{
		if (strcmp(new, temp->new_command) == 0)
		{
			return (temp->new_command);
		}
		temp = temp->next;
	}
	return (NULL);
}
/**
 * check_alias - is a function that check if an alias exist
 * @args: is a list of arguments
 * return: Name of alias if success or NULL if not
 */
int execute_alias(char *main, char **args)
{
	if (execve(main, args, environ) == -1)
	{
		fprintf(stderr, "%s: No such file or directory\n", args[0]);
		exit(EXIT_FAILURE);
	}
	return (0);
}
/**
 * create_alias - is a function that creates an alias
 * @new: is the name of the new command
 * @main: is the name fo the main command
 * return: the new node
 */
alias *create_alias(alias *alias_list, char *new, char *main)
{
	printf("entered create alias function\n");
	alias *newnode = (alias *)malloc(sizeof(alias));
	char keyvalue_pair[100];
	int i;
	int j;
	alias *temp = alias_list;

	for (i = 0; new[i] != '\0'; i++)
	{
		keyvalue_pair[i] = new[i];
	}
	keyvalue_pair[i] = '=';

	for (j = 0; main[j] != '\0'; j++)
	{
		keyvalue_pair[i + j +  1]  = main[j];
	}
	keyvalue_pair[i + j + 1] = '\0';

	newnode->saved_alias = strdup(keyvalue_pair);
	newnode->main_command = strdup(main);
	newnode->new_command = strdup(new);
	newnode->next = NULL;

	while (temp != NULL)
	{
		if (strcmp(new, temp->new_command) == 0)
		{
			free(temp->main_command);
			temp->main_command = strdup(main);
			break;
		}
		temp = temp->next;
	}

	printf("created alias\n");
	if (!temp)
	{
		alias_list = add_alias(alias_list, new, main);
	}

	
	return (newnode);
}
/**
 * add_alias - is a function that adds an alias to the list
 * @new: is the name of the new command
 * @main: is the name fo the main command
 * @head: is a pointer to a list of aliases
 * return: the head of the list
 */
alias *add_alias(alias *head, char *new, char *main)
{
	printf("enteretr add_alias function\n");
	alias *new_alias = create_alias(alias_list, new, main);
	alias *temp = head;

	if (head == NULL)
	{
		head = new_alias;
	}
	else
	{
		while (temp->next != NULL)
		{
			temp = temp->next;
		} temp->next = new_alias;
	}

	printf("added alias to list successfully\n");
	return (head);
}
/**
 * print_alias_list - is a function that prints out the alias list
 * @head: is a pointer to a list of aliases
 * return: void
 */
void print_alias_list(alias *head)
{
	printf("entered print alias funciton\n");
	alias *temp = head;

	while (temp != NULL)
	{
		printf("alias %s=%s\n", temp->new_command, temp->main_command);
		temp = temp->next;
	}
	printf("print list successfully\n");
}
