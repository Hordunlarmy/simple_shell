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
		equals = _strchr(envi_ron, '=');

		*equals = '\0';
		if (_strcmp(envi_ron, name) == 0)
		{
			*equals = '=';
			return (environ[i] + _strlen(name) + 1);
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
 * @fd: file descriptor of input stream
 * Return: string buffer
 */
ssize_t get_line(char **buffer, size_t *bufsize, int fd)
{
	static char line_buffer[1024];
	static size_t line_buffer_size = 1024;
	ssize_t i, read_bytes;
	size_t len = 0;
	*bufsize = 1024;
	*buffer = malloc(*bufsize * sizeof(char));
	if (!*buffer)
	{
		free(*buffer);
		perror("get_line");
		exit(EXIT_FAILURE);
	}
	while ((read_bytes = read(fd, line_buffer, line_buffer_size)) != 0)
	{
		if (read_bytes == -1)
		{
			perror("read");
			exit(EXIT_FAILURE);
		}
		for (i = 0; i < read_bytes; i++)
		{
			if (line_buffer[i] == '\n')
			{
				(*buffer)[len] = '\0';
				return (len);
			}
			(*buffer)[len] = line_buffer[i];
			len++;
			if (len >= *bufsize)
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
	}
	return (-1);
}
