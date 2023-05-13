#include "main.h"

/**
 * get_path - Entry point
 * @executable: file
 * @args: pointer to argument array
 * Return: Always 0 (Success)
 */
char get_path(char *executable, char **args)
{
char *env_path = _getenv("PATH");
char *token = str_tok(env_path, ":");

while (token != NULL)
{
	executable = malloc(strlen(token) + strlen(args[0]) + 2);
	strcpy(executable, token);
	strcat(executable, "/");
	strcat(executable, args[0]);

	if (access(executable, F_OK) == 0)
	{
		if (execute(executable) == -1)
		{
			perror("execve error");
		}
		free(executable);
		exit(EXIT_FAILURE);
	}
	free(executable);
	token = strtok(NULL, ":");
}
perror("Command not found");
exit(EXIT_FAILURE);
}
