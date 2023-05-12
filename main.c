#include "main.h"

/**
 * main - Entry point
 * @argc: argument count
 * @argv: argument vector
 * Return: Always 0 (Success)
 */
int main(int argc, char **argv)
{
	char *shellPrompt = "#DoingHardThings $ ";
	char *command;
	size_t n = 0;
	size_t r_value = 0;
	pid_t pid;
	char *args[100];
	int i = 1;
	/*char *envp[] = {NULL};*/

	for (; ;)
	{
		printf("%s", shellPrompt);
		r_value = getline(&command, &n, stdin);

		pid = fork();

		args[0] = strtok(command, " \n");

		if (pid == -1)
		{
			printf("child process failed/n");
			exit(EXIT_FAILURE);
		}

		if (pid == 0)
		{
			while (args[i] != NULL)
			{
				args[i] = strtok(NULL, " \n");
				i++;
			}
			execve(args[0], args, NULL);
			exit(EXIT_FAILURE);
		}

		if (pid != 0)
		{
			wait(NULL);
		}

	}

	free(command);

	return (0);
}
