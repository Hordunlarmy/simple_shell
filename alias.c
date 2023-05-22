#include "main.h" 
/**
 * my_alias - is a function that handles the command
 * if it is alias
 *
 * @args: ths is a  list of commands
 * Return: 0
 */
int my_alias(char **args, alias **alias_list)
{
	printf("entered my_alias function\n");
	int i = 1;
	alias *list_copy = *alias_list;
	char *equals;

	if (args[i] == NULL)
	{
		if (list_copy == NULL)
		{
			printf("NULL\n");
		}
		else 
		{
			printf("wants to enter print alias list\n");
			print_alias_list(list_copy);
		}
		return (0);
	}
	for (i = 1; args[i] != NULL; i++)
	{
		equals = strchr(args[i], '=');
		list_copy = *alias_list;
		if (equals == NULL)
		{
			while (list_copy != NULL)
			{
				if (strcmp(args[i], list_copy->main_command) == 0)
				{
					print_alias_list(list_copy);
					break;
				}
				list_copy = list_copy->next;
			}
		}
		else
		{
			printf("wants to enter create keyvalue_pair function args = %s \n",args[i]);
			create_keyvalue_pair(&list_copy, args[i], equals);
		}
	}
	return (0);
}
