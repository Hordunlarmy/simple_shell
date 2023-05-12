#include "main.h"

/**
 * _fork - Entry point
 * @command: command passed
 * Return: id of fork
 */
pid_t _fork(char *command)
{
	char *args[1000];
	pid_t pid;
	int i = 1;

	if (access(command, X_OK) != 0)
	{
		printf("%s: command not found\n", command);
		exit(EXIT_FAILURE);
	}

	pid = fork();
	args[0] = strtok(command, " \n");

	if (pid == -1)
		exit(EXIT_FAILURE);

	if (pid == 0)
	{
		while (args[i] != NULL)
		{
			args[i] = strtok(NULL, " \n");
			i++;
		}
		if (args[0] == NULL)
			exit(EXIT_SUCCESS);

		else if (execve(args[0], args, NULL) == -1)
		{
			perror("No such file or directory");
			exit(EXIT_FAILURE);
		}
	}

	if (pid != 0)
	{
		wait(NULL);
	}
	return (pid);
}
