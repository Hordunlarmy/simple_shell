#include "main.h"

/**
 * tokenize - Entry point
 * @command: string passed
 * @args: arguments passed
 * Return: Always 0 (Success)
 */
int tokenize(char *command, char **args)
{
	int i = 0;
	char *token = str_tok(command, " \n");

		while (token != NULL && i < 10 - 1)
		{
			args[i++] = token;
			token = str_tok(NULL, " \n");
		}
		return (i);
}
