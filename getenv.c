#include <stdio.h>
#include "main.h"
#include <string.h>
/**
 * _getenv - is a function that checks for
 * a variable in the environment
 * @name: is a a pointer to an array of characters
 * Return: a pointer if success or NULL if failed
 */


char *_getenv(const char *name)
{
	int i = 0;
	char *envi_ron;
	char *equals;

	while (environ[i] != NULL)
	{
		envi_ron = environ[i];
		equals = strchr(envi_ron, '=');

		*equals = '\0';
		if (strcmp(envi_ron, name) == 0)
		{
			*equals = '=';
			return (environ[i] + strlen(name) + 1);
		}
		*equals = '=';
		i++;
	}
	return (NULL);
}
