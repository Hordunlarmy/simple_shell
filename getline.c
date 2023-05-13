#include "main.h"

/**
 * get_line - Entry point
 * @buffer: to hold command and arguments
 * @bufsize: size of buffer
 * @stream: input type
 * Return: string buffer
 */
ssize_t get_line(char **buffer, size_t *bufsize, FILE *stream)
{
	ssize_t len;
	*bufsize = 1024;
	*buffer = malloc(*bufsize * sizeof(char));

	if (!*buffer)
	{
		perror("get_line");
		exit(EXIT_FAILURE);
	}

	while ((len = getline(buffer, bufsize, stream)) != -1)
	{
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
