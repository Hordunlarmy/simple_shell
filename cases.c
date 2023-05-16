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
	if (strcmp(args[0], "setenv") == 0)
	{
		my_setenv(args);
	}
	if (strcmp(args[0], "unsetenv") == 0)
	{
		my_unsetenv(args);
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


/**
 * my_setenv - Entry point
 * @args: command and arguments
 * Return: Always 0 (Success)
 */
int my_setenv(char **args)
{
	if (args[1] == NULL || args[2] == NULL || args[3] != NULL)
	{
		fprintf(stderr, "Error: Invalid argument(s)\n");
		return (1);
	}

	int i, len;
	char *name = args[1];
	char *value = args[2];

	len = strlen(name) + strlen(value) + 2;
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
	i++;

	for (int j = 0; value[j] != '\0'; j++)
	{
		env[i] = value[j];
		i++;
	}

	env[i] = '\0';

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
	if (args[1] == NULL || args[2] != NULL)
	{
		fprintf(stderr, "Error: Invalid argument(s)\n");
		return (1);
	}

	char *name = args[1];
	int len = strlen(name);

	for (int i = 0; environ[i] != NULL; i++)
	{
		if (strncmp(environ[i], name, len) == 0 && environ[i][len] == '=')
		{
			for (int j = i; environ[j] != NULL; j++)
			{
				environ[j] = environ[j + 1];
			}

			break;
		}
	}

	return (0);
}
