#include "main.h"

/**
 * cases - Entry point
 * @args: command and arguments
 * Return: Always 0 (Success)
 */
void cases(char **args)
{
	int exit_status;

	if (strcmp(args[0], "exit") == 0)
	{
		if (args[1] != NULL)
		{
			exit_status = atoi(args[1]);
			exit(exit_status);
		}
		exit(0);
	}
	if (args[0] == NULL)
		exit(EXIT_SUCCESS);

	if (strcmp(args[0], "env") == 0)
	{
		my_env();
	}
	if (strcmp(args[0], "cd") == 0)
	{
		my_cd(args);
	}
}

/**
 * my_env - Entry point
 *
 * Return: void
 */
void my_env(void)
{
	char **env = environ;

	while (*env != NULL)
	{
		printf("%s\n", *env);
		env++;
	}
}


/**
 * my_cd - Entry point
 * @args: arguments passed
 * Return: void
 */
int my_cd(char **args)
{
	char *new_dir, *old_dir;
	char cwd[1024];

	if (args[1] == NULL || strcmp(args[1], "~") == 0)
		new_dir = getenv("HOME");
	else if (strcmp(args[1], "-") == 0)
		new_dir = getenv("OLDPWD");
	else
		new_dir = args[1];

	old_dir = getenv("PWD");

	if (setenv("OLDPWD", old_dir, 1) != 0)
	{
		fprintf(stderr, "Error: Could not set OLDPWD environment variable\n");
		return (1);
	}

	if (chdir(new_dir) != 0)
	{
		fprintf(stderr, "%s: %s: No such file or directory\n", args[0], args[1]);
		return (1);
	}

	if (getcwd(cwd, sizeof(cwd)) == NULL)
	{
		fprintf(stderr, "Error: Could not get current directory\n");
		return (1);
	}
	if (setenv("PWD", cwd, 1) != 0)
	{
		fprintf(stderr, "Error: Could not set PWD environment variable\n");
		return (1);
	}

	return (0);
}
