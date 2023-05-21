#ifndef MAIN_H
#define MAIN_H
#define _POSIX_C_SOURCE 200809L
#define _XOPEN_SOURCE 700

/* standard library functions */
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>

/** Global environment */
extern char **environ;



/** MACROS **/
#define MAXARGS 128



/**
 * struct linked_path - This is a linked list containing
 * ---------------------Each diretory in the path
 * @dir: This is a directory Path
 * @next: is apointer to the next directory
 */
typedef struct linked_path
{
	char *dir;
	struct linked_path *next;
} linked_path;

/**
 * struct alias - This is a linked list containing
 * ---------------------Each diretory in the path
 * @saved_alias: this is the keyvalue pair
 * @main_command: is the main command
 * @new_command: is a new command
 * @next: is a pointer to the next alias
 */
typedef struct alias
{
	char *main_command;
	char *new_command;
	struct alias *next;
} alias;

/** global alias list **/
alias *alias_list;



int my_alias(char **args, alias *alias_list);
char *get_dir();
int _setenv(const char *name, const char *value, int overwrite);
int check_path(char **args);
char *_getenv(const char *name);
linked_path *link_path(void);
int execute(char *command);
int execute_with_path(char **args);
ssize_t get_line(char **buffer, size_t *bufsize, FILE *stream);
char *str_tok(char *command, const char *delim);
int tokenize(char *command, char **args);
int built_ins(char **args);
int my_env(void);
int my_cd(char **args);
int my_setenv(const char *name, const char *value, int overwrite);
int my_unsetenv(char **args);
int my_echo(char **args);
int create_keyvalue_pair(alias *alias_list, char *args, char *equals);
alias *add_alias(alias *head, char *new, char *main);
int print_alias_list(alias *head);
char *check_alias(char *new);
int execute_alias(char *main, char **args);


#endif /* MAIN_H */
