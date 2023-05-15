#include "main.h"

/**
 * main - Entry point
 * @argc: argument count
 * @argv: argument vector
 * Return: Always 0 (Success)
 */
int main(int argc, char **argv)
{
	char *shellPrompt = "#cisfun$ ";
	size_t n = 0;

	for (; ;)
	{
		printf("%s", shellPrompt);
		if ((get_line(argv, &n, stdin)) == -1)
		{
			feof(stdin) ? exit(EXIT_SUCCESS) : exit(EXIT_FAILURE);
		}
		execute(*argv);
	}

	free(argv);

	return (0);
}
