#include "main.h"
/**
 * execute - Entry point
 * @command: command passed
 * Return: id of fork
 */
pid_t execute(char *command)
{
	char *args[MAXARGS];
	pid_t pid;
	int i;

	i = tokenize(command, args);
	args[i] = NULL;
	if (args[i - 1] == NULL)
		exit(EXIT_SUCCESS);

	pid = fork();

	if (pid == -1)
		exit(EXIT_FAILURE);

	if (pid != 0)
		wait(NULL);
	else if (access(args[0], F_OK) == 0)
	{
		if (args[0][0] == '/' || args[0][0] == '.')
		{
			if (execve(args[0], args, NULL) == -1)
			{
				fprintf(stderr, "No such file or directory\n");
				exit(EXIT_FAILURE);
			}
		}
		execute_with_path(command, args);
	}
	else
	{
		fprintf(stderr, "No such file or directory\n");
		exit(EXIT_FAILURE);
	}

	return (pid);
}
