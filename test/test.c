#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <string.h>

int main(void)
{
	char commands[] = "ls; ls; ls";
	char *token = strtok(commands, ";");

	while (token != NULL)
	{
		pid_t pid = fork();

		if (pid < 0)
		{
			fprintf(stderr, "Fork failed\n");
			exit(1);
		} else if (pid == 0)
		{
			// Child process
			char *args[64];  // Maximum arguments count, adjust accordingly if needed
			int argCount = 0;

			char *cmdToken = strtok(token, " ");

			while (cmdToken != NULL)
			{
				args[argCount++] = cmdToken;
				cmdToken = strtok(NULL, " ");
			}
			args[argCount] = NULL;

			execvp(args[0], args);
			fprintf(stderr, "Execution failed for command: %s\n", token);
			exit(1);
		}
		else
		{
			// Parent process
			wait(NULL);
		}

		token = strtok(NULL, ";");
	}

	return (0);
}
