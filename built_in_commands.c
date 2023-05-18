#include "main.h"

/**
 * built_ins - Entry point
 * @args: command and arguments
 * Return: Always 0 (Success)
 */
int built_ins(char **args)
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
		return (1);
	}
	if (strcmp(args[0], "cd") == 0)
	{
		my_cd(args);
		return (1);
	}
	if (strcmp(args[0], "setenv") == 0)
	{
		my_setenv(args[1], args[2], 1);
		return (1);
	}
	if (strcmp(args[0], "unsetenv") == 0)
	{
		my_unsetenv(args);
		return (1);
	}
	if (strcmp(args[0], "alias") == 0)
	{
		my_alias(args);
	}
	return (0);
}

/**
 * my_env - Entry point
 *
 * Return: void
 */
int my_env(void)
{
	char **env = environ;

	while (*env != NULL)
	{
		printf("%s\n", *env);
		env++;
	}
	return (0);
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
		new_dir = _getenv("HOME");
	else if (strcmp(args[1], "-") == 0)
		new_dir = _getenv("OLDPWD");
	else
		new_dir = args[1];

	old_dir = _getenv("PWD");

	if (my_setenv("OLDPWD", old_dir, 1) != 0)
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
	if (my_setenv("PWD", cwd, 1) != 0)
	{
		fprintf(stderr, "Error: Could not set PWD environment variable\n");
		return (1);
	}

	return (0);
}


/**
 * my_setenv - Entry point
 * @name: name of environment variable
 * @value: environment value
 * @overwrite: replace variable
 * Return: Always 0 (Success)
 */
int my_setenv(const char *name, const char *value, int overwrite)
{
	int i, j;
	int len = strlen(name) + strlen(value) + 2;
	char *env = malloc(len);

	if (env == NULL)
	{
		fprintf(stderr, "Error: Memory allocation failed\n");
		return (1);
	}

	for (i = 0; name[i] != '\0'; i++)
	{
		env[i] = name[i];
	}
	env[i] = '=';

	for (j = 0; value[j] != '\0'; j++)
	{
		env[i + j + 1] = value[j];
	}
	env[i + j + 1] = '\0';

	if (overwrite == 0 && _getenv(name) != NULL)
	{
		return (0);
	}
	if (putenv(env) != 0)
	{
		fprintf(stderr, "Error: Setting environment variable failed\n");
		return (1);
	}
	return (0);
}

/**
 * my_unsetenv - Entry point
 * @args: command and arguments
 * Return: Always 0 (Success)
 */
int my_unsetenv(char **args)
{
	int i, j;
	char *name = args[1];
	int len = strlen(name);

	if (args[1] == NULL || args[2] != NULL)
	{
		fprintf(stderr, "Error: Invalid argument(s)\n");
		return (1);
	}

	for (i = 0; environ[i] != NULL; i++)
	{
		if (strncmp(environ[i], name, len) == 0 && environ[i][len] == '=')
		{
			for (j = i; environ[j] != NULL; j++)
			{
				environ[j] = environ[j + 1];
			}
			break;
		}
	}

	return (0);
}
