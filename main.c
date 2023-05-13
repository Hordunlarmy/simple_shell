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
	char *command;
	size_t n = 0;
	size_t r_value = 0;

	for (; ;)
	{
		printf("%s", shellPrompt);
		r_value = getline(&command, &n, stdin);

		if (r_value == -1)
			exit(EXIT_FAILURE);
		execute(command);
	}

	free(command);

	return (0);
}
