#include "main.h" 
/**
 * my_alias - is a function that handles the command
 * if it is alias
 *
 * @args: ths is a  list of commands
 * Return: 0
 */
int my_alias(char **args, alias *alias_list)
{
	printf("entered my_alias function\n");
	int i = 1;
	alias *temp = alias_list
	char *main_command;
	char *new_command;

	if (strcmp(args[i + 1],"=") == 0)
	{
		new_command = args[i];
		main_command = args[i + 2];
		printf("seperated args sucesfully %s=%s\n", new_command, main_command);
		create_alias(alias_list, new_command, main_command);
		return (0);
	}
	else if (args[i] == NULL)
	{
		printf("wants to enter print alias list\n");
		print_alias_list(temp);
		return (0);
	}
	else
	{
		printf("invalid command");
		return (-1);
	}
	return (0);
}
