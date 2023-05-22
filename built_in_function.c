#include "main.h"

/**
 * built_ins - Entry point
 * @args: command and arguments
 * Return: Always 0 (Success)
 */
int built_ins(char **args)
{
	int exit_status;

	if (_strcmp(args[0], "exit") == 0)
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

	if (_strcmp(args[0], "env") == 0)
	{
		my_env();
		return (1);
	}
	if (_strcmp(args[0], "cd") == 0)
	{
		my_cd(args);
		return (1);
	}
	if (_strcmp(args[0], "setenv") == 0)
	{
		my_setenv(args[1], args[2], 1);
		return (1);
	}
	if (_strcmp(args[0], "unsetenv") == 0)
	{
		my_unsetenv(args);
		return (1);
	}
	if (_strcmp(args[0], "echo") == 0)
	{
		my_echo(args);
		return (1);
	}
	if (strcmp(args[0],"alias") == 0)
	{
		my_alias(args, &alias_list);
		return (1);
	}
	return (0);
}
