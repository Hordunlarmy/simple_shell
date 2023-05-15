#include "main.h"
/**
 * chack_path - is a function that checks for a command in the path
 * @args: is a command
 * Return: pid
 */
int check_path(char **args)
{
	linked_path *temp = link_path();
	char fullpath[1024];

	while(temp != NULL)
	{
		sprintf(fullpath, "%s/%s", temp->dir, args[0]);
		if (access(fullpath, F_OK) == 0)
		{
			return (1);
		}
		temp = temp->next;
	}
	return (-1);
}
