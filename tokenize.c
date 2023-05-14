#include "main.h"

/**
 * tokenize - Entry point
<<<<<<< HEAD
 * @command: string passed
 * @args: arguments passed
=======
 * @command: argument line
 * @args: argument parsed
>>>>>>> e466b39a7e900e2416af90a0f7db4f27837ce0a0
 * Return: Always 0 (Success)
 */
int tokenize(char *command, char **args)
{
	int i = 0;
<<<<<<< HEAD
	char *token = strtok(command, " \n");

	while (token != NULL && i < 10 - 1)
	{
		args[i++] = token;
		token = strtok(NULL, " \n");
	}
	args[i] = NULL;

	return (i);
=======
	char *token = str_tok(command, " \n");

		while (token != NULL && i < 10 - 1)
		{
			args[i++] = token;
			token = str_tok(NULL, " \n");
		}
		return (i);
>>>>>>> e466b39a7e900e2416af90a0f7db4f27837ce0a0
}
