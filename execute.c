#include "main.h"

/**
 * execute - Entry point
 * @argv: command passed
 * Return: id of fork
 */
pid_t execute(char **argv)
{
	char *args[10];
	pid_t pid;
	int i;

	pid = fork();

	if (pid == -1)
		exit(EXIT_FAILURE);

	if (pid != 0)
		wait(NULL);

	if (pid == 0)
	{
<<<<<<< HEAD
		i = tokenize(*argv, args);
=======
		i = tokenize(command, args);
>>>>>>> e466b39a7e900e2416af90a0f7db4f27837ce0a0
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
