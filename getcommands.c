#include "main.h"
/**
 * get_dir - is a function that prints the working dir
 * Return: the working directory
 */
char *get_dir()
{
	char *cwd = malloc(sizeof(char) * 1024);

	if (cwd == NULL)
	{
		perror("malloc error");
		return (NULL);
	}

	if (getcwd(cwd, 1024) != NULL)
	{
		return (cwd);
	}
	else
	{
		perror("getcwd error");
		free(cwd);
		return (NULL);
	}
}
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
/**
 * get_line - Entry point
 * @buffer: to hold command and arguments
 * @bufsize: size of buffer
 * @stream: input type
 * Return: string buffer
 */
ssize_t get_line(char **buffer, size_t *bufsize, FILE *stream)
{
	size_t len = 0;
	*bufsize = 1024;
	*buffer = malloc(*bufsize * sizeof(char));
	
	if (!*buffer)
	{
		perror("get_line");
		exit(EXIT_FAILURE);
	}
	while (fgets(*buffer, *bufsize, stream) != NULL)
	{
		len = strlen(*buffer);
		if (len > 0 && (*buffer)[len - 1] == '\n')
		{
			(*buffer)[len - 1] = '\0';
			return (len);
		}
		if (*bufsize - 1 <= len)
		{
			*bufsize *= 2;
			*buffer = realloc(*buffer, *bufsize * sizeof(char));
			if (!*buffer)
			{
				perror("get_line");
				exit(EXIT_FAILURE);
			}
		}
	}
	return (-1);
}
