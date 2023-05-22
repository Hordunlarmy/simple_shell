#include "main.h"

/**
 * main - Entry point
 * @argc: argument count
 * @argv: argument vector
 * Return: Always 0 (Success)
 */
int main(int argc __attribute__((unused)), char **argv)
{
	bool interactive = isatty(STDIN_FILENO);
	char *shellPrompt = interactive ? "#cisfun$ " : "";
	size_t n = 0;
	alias *alias_list;
	ssize_t line;

	for (;;)
	{
		if (interactive)
		{
			write(STDOUT_FILENO, shellPrompt, 10);
			fflush(stdout);
		}
		line = get_line(argv, &n, STDIN_FILENO);
		if (line == -1)
		{
			if (feof(stdin))
			{
				write(1, "\n", 1);
			}
			write(1, "\n", 1);
			break;
		}
		if (line == 0 || **argv == '\n')
			continue;
		execute(*argv);
	}
	return (0);
}
