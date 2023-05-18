#include "main.h"

/**
 * main - Entry point
 * @argc: argument count
 * @argv: argument vector
 * Return: Always 0 (Success)
 */
int main(int argc __attribute__((unused)), char **argv)
{
	char *shellPrompt = "#cisfun$ ";
	size_t n = 0;

	for (; ;)
	{
		printf("%s/%s", get_dir(), shellPrompt);
		fflush(stdout);
		if ((get_line(argv, &n, stdin)) == -1)
		{
			feof(stdin) ? exit(EXIT_SUCCESS) : exit(EXIT_FAILURE);
		}
		execute(*argv);
	}

	free(argv);

	return (0);
}
