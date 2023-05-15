#include "main.h"
/**
 * execute_with_path - is a function that exeuctes command from the path
 * @command: is the command to be executed
 * Return: The process id
 */
int  execute_with_path(char *command, char **args)
{
	linked_path *temp = link_path();
	printf("it entered exec path function");
	char fullpath[1024];
	pid_t pid;

	while (temp != NULL)
	{
		sprintf(fullpath, "%s/%s", temp->dir, args[0]);
		printf("this should be the first fullpath - %s", fullpath);
		execve(fullpath, args, environ);
		temp = temp->next;
	}
	return (-1);

}
