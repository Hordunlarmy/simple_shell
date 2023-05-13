#include "main.h"

/**
 * execute - Entry point
 * @command: command passed
 * Return: id of fork
 */
pid_t execute(char *command)
{
	char *args[10];
	pid_t pid;
	int i = 1;

	pid = fork();

	if (pid == -1)
		exit(EXIT_FAILURE);

	if (pid == 0)
	{
		args[0] = strtok(command, " \n");

		while (args[i] != NULL && i < 10 - 1)
		{
			args[i] = strtok(NULL, " \n");
			i++;
		}
		if (args[0] == NULL)
			exit(EXIT_SUCCESS);
		else if (execve(args[0], args, NULL) == -1)
		{
			perror("No such file or directory");
			return (1);
		}
	}

	if (pid != 0)
	{
		wait(NULL);
	}
	return (pid);
}
