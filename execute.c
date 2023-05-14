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
	int i = 0;
	char *token;

	pid = fork();

	if (pid == -1)
		exit(EXIT_FAILURE);

	if (pid != 0)
		wait(NULL);

	if (pid == 0)
	{
		token = str_tok(command, " \n");

		while (token != NULL && i < 10 - 1)
		{
			args[i++] = token;
			token = str_tok(NULL, " \n");
		}
		args[i] = NULL;
		if (args[i - 1] == NULL)
			exit(EXIT_SUCCESS);
		if (execve(args[0], args, NULL) == -1)
		{
			perror("No such file or directory");
			exit(EXIT_FAILURE);
		}
	}

	return (pid);
}
