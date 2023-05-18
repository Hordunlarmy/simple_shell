#include "main.h"
/**
 * check_alias - is a function that check if an alias exist
 * @args: is a list of arguments
 * return: Name of alias if success or NULL if not
 */
char *check_alias(char *args)
{
	alias *temp = alias_list();

	while (temp != NULL)
	{
		if (strcmp(args, temp->name) == 0)
		{
			return (temp->name);
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
int execute_alias(char *main_command, char **args)
{
	if (execve(main_command, args, environ) == -1)
	{
		fprintf(stderr, "%s: No such file or directory\n", args[0]);
		exit(EXIT_FAILURE);
	}
	return (0);
}

