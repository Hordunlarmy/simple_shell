#include "main.h"
/**
 * execute - Entry point
 * @command: command passed
 * Return: id of fork
 */
int exit_status = 0;
int execute(char *command)
{
	char *args[MAXARGS];
	pid_t pid;
	int i, status;

	i = tokenize(command, args);
	args[i] = NULL;

	if (built_ins(args))
		return (0);

	pid = fork();

	if (pid == -1)
		exit(EXIT_FAILURE);

	if (pid != 0)
	{
		wait(&status);
		if (WIFEXITED(status))
		{
			exit_status = WEXITSTATUS(status);
		}
		return (0);
	}

	if (pid == 0)
	{
		if (args[0][0] == '/' || args[0][0] == '.')
		{
			if (execve(args[0], args, environ) == -1)
			{
				fprintf(stderr, "%s: No such file or directory\n", args[0]);
				exit(EXIT_FAILURE);
			}
		}
		else if (check_path(args) == 1)
		{
			execute_with_path(args);
		}
		else
		{
			fprintf(stderr, "%s: No such file or directory\n", args[0]);
			exit(EXIT_FAILURE);
		}
	}

	return (0);
}
