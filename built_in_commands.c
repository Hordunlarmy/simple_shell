#include "main.h"
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
		write(STDOUT_FILENO, *env, _strlen(*env));
		write(STDOUT_FILENO, "\n", 1);
		env++;
	}

	return (0);
}


/**
 * my_cd - Entry point
 * @args: arguments passed
 * @line_num: command count
 * Return: void
 */
int my_cd(char **args, int line_num)
{
	char *new_dir, *old_dir;
	char cwd[1024];
	char *cd_err = cd_error(args);

	if (args[1] == NULL || _strcmp(args[1], "~") == 0)
		new_dir = _getenv("HOME");
	else if (_strcmp(args[1], "-") == 0)
		new_dir = _getenv("OLDPWD");
	else
		new_dir = args[1];

	old_dir = _getenv("PWD");

	if (my_setenv("OLDPWD", old_dir, 1) != 0)
	{
		perror("Could not set OLDPWD environment variable");
		return (1);
	}

	if (chdir(new_dir) != 0)
	{
		print_error(args[0], cd_err, line_num);
		return (1);
	}

	if (getcwd(cwd, sizeof(cwd)) == NULL)
	{
		perror("Could not get current directory");
		return (1);
	}
	if (my_setenv("PWD", cwd, 1) != 0)
	{
		perror("Could not set PWD environment variable");
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
	int len = _strlen(name) + _strlen(value) + 2;
	char *env_save = malloc(len);

	if (name == NULL || value == NULL)
	{
		perror("Invalid arguments");
		return (1);
	}
	if (env_save == NULL)
	{
		perror("Memory allocation failed");
		return (1);
	}

	for (i = 0; name[i] != '\0'; i++)
	{
		env_save[i] = name[i];
	}
	env_save[i] = '=';

	for (j = 0; value[j] != '\0'; j++)
	{
		env_save[i + j + 1] = value[j];
	}
	env_save[i + j + 1] = '\0';

	if (overwrite == 0 && _getenv(name) != NULL)
	{
		return (0);
	}
	if (putenv(env_save) != 0)
	{
		perror("Setting environment variable failed");
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
	int len = _strlen(name);

	if (args[1] == NULL || args[2] != NULL)
	{
		perror("Invalid argument");
		return (1);
	}

	for (i = 0; environ[i] != NULL; i++)
	{
		if (_strncmp(environ[i], name, len) == 0 && environ[i][len] == '=')
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
