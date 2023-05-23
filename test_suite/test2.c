#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char **environ;

int my_echo(char **args);

int main(int argc, char **argv) {
	if (argc < 2) {
		printf("Usage: %s <variable>\n", argv[0]);
		return 1;
	}

	return my_echo(argv);
}

int my_echo(char **args) {
	const char* target_var = args[1];
	size_t target_var_len = strlen(target_var);

	for (char **env = environ; *env != NULL; ++env) {
		char *env_var = *env;
		if (strncmp(env_var, target_var, target_var_len) == 0) {
			// Found the target variable
			char *value = strchr(env_var, '=');  // Find the '=' character
			if (value != NULL) {
				printf("The value of %s is: %s\n", target_var, value + 1);
				return 0;
			}
		}
	}

	printf("Variable '%s' not found.\n", target_var);
	return 1;
}
