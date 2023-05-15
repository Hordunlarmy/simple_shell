#include "main.h"

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
