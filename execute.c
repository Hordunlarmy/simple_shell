#include "main.h"
/**
 * execute - Entry point
 * @command: command passed
 * Return: id of fork
 */
int execute(char *command)
{
	char *args[MAXARGS];
	char command_path[MAX_PATH_LENGTH];
	pid_t pid;
	int i;

	i = tokenize(command, args);
	args[i] = NULL;

	if (built_ins(args))
		return (0);
	if (access(args[0], X_OK) == -1)
	{
		sprintf(command_path, "/bin/%s", args[0]);
		if (access(command_path, X_OK) == -1)
		{
			fprintf(stderr, "%s: No such file or directory\n", args[0]);
			return (0);
		}
		args[0] = command_path;
	}

	pid = fork();

	if (pid == -1)
		exit(EXIT_FAILURE);

	if (pid != 0)
		run_parent();

	if (pid == 0 && args[0][0] != '\0')
	{
		run_child(args);
	}

	return (0);
}


/**
 * run_child - Entry point
 * @args: command passed
 * Return: id of fork
 */
int run_child(char **args)
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
	return (0);
}

/**
 * run_parent - Entry point
 *
 * Return: id of fork
 */
int run_parent(void)
{
	exit_stat();
	return (0);
}

/**
 * exit_stat - Entry point
 *
 * Return: id of fork
 */
int exit_stat(void)
{
	int status;
	static int exit_status;

	wait(&status);

	if (WIFEXITED(status))
	{
		exit_status = WEXITSTATUS(status);
	}
	return (exit_status);
}
