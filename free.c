#include "main.h"
/**
 * free_args - is a function that frees the arguments
 * @args: this is the tokenized arguments
 * Return:void
 */
void  _freeargs(char **args)
{
	int index;

	for (index = 0; args[index] != NUL || args[index + 1] != NULL; index++)
	{
		free(args[index]);
	}
}

/**
 * free_path - is a function that frees the path
 * @path: is a function that frees the path
 * Return:void
 */
void _freepath(linked_path *path)
{
	linked *temp;

	while (temp != NULL)
	{
		temp = path->next;
		free(path->dir);
		free(path);
		path = temp;
	}
}
/**
 * _freeenv - is a function that frees the eniron
 * Return:void
 */
void _freeenv(void)
{
	int index;

	for (index = 0; environ[index] != NULL; index++)
	{
		free(environ[index]);
	}
	free(environ);
}
