#include "main.h"
/**
 * execute_with_path - is a function that exeuctes command from the path
 * @args: is an array of tokenized commands
 * Return: The process id
 */
int execute_with_path(char **args)
{
	linked_path *temp = link_path();
	char fullpath[1024];

	while (temp != NULL)
	{
		sprintf(fullpath, "%s/%s", temp->dir, args[0]);
		if (access(fullpath, F_OK) == 0)
		{
			execve(fullpath, args, NULL);
		}
		temp = temp->next;
	}
	return (-1);

}
