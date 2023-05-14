#include "main.h"

/**
 * str_tok - Entry point
 * @command: command line
 * @delim: delimieter
 * Return: current token
 */
char *str_tok(char *command, const char *delim)
{
	static char *last_token;
	char *current_token;
	const char *d;

	if (command != NULL)
		last_token = command;

	if (last_token == NULL)
		return (NULL);

	current_token = last_token;

	for (; *last_token != '\0'; last_token++)
	{
		d = delim;
		for (; *d != '\0'; d++)
		{
			if (*last_token == *d)
			{
				*last_token = '\0';
				last_token++;
				if (*last_token != '\0')
					return (current_token);
				else
					return (NULL);
			}
		}
	}

	last_token = NULL;
	return (current_token);
}
