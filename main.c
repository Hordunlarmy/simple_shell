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
	char *shellPrompt = interactive ? "$ " : "";
	size_t n = 0;
	ssize_t line;
	int line_num = 1;

	for (;;)
	{
		if (interactive)
		{
			write(STDOUT_FILENO, shellPrompt, 3);
			fflush(stdout);
		}
		line = get_line(argv, &n, STDIN_FILENO);
		if (line == -1)
		{
			if (feof(stdin))
			{
				write(1, "\n", 1);
			}
			break;
		}
		if (line == 0 || **argv == '\n')
			continue;
		execute(*argv, line_num);
		line_num++;
		_freeargs(argv);
	}

	return (0);
}
