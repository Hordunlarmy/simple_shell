#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

void executeCommand(char *command) {
	char *args[10]; // Maximum 10 arguments for a command
	int i = 0;

	// Tokenize the command using whitespace as the delimiter
	char *token = strtok(command, " ");
	while (token != NULL) {
		args[i++] = token;
		token = strtok(NULL, " ");
	}

	args[i] = NULL; // Set the last argument to NULL

	// Fork a child process to execute the command
	pid_t pid = fork();
	if (pid == 0) {
		// Child process
		execvp(args[0], args);

		// execvp only returns if there's an error
		perror("Error executing command");
		exit(EXIT_FAILURE);
	} else if (pid > 0) {
		// Parent process
		int status;
		waitpid(pid, &status, 0);

		if (WIFEXITED(status)) {
			// Child process terminated normally
			printf("Command executed successfully.\n");
		} else {
			printf("Command execution failed.\n");
		}
	} else {
		// Forking failed
		perror("Error forking process");
		exit(EXIT_FAILURE);
	}
}

int main() {
	char commands[256];
	printf("Enter multiple commands separated by semicolons (;):\n");
	fgets(commands, sizeof(commands), stdin);

	// Tokenize the commands using semicolon as the delimiter
	char *token = strtok(commands, ";");
	while (token != NULL) {
		// Trim leading and trailing whitespaces from the command
		char *command = token;
		while (*command == ' ' || *command == '\t' || *command == '\n') {
			command++;
		}
		char *end = command + strlen(command) - 1;
		while (end > command && (*end == ' ' || *end == '\t' || *end == '\n')) {
			end--;
		}
		*(end + 1) = '\0';

		if (strlen(command) > 0) {
			executeCommand(command);
		}

		token = strtok(NULL, ";");
	}

	return 0;
}
