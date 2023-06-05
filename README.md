<picture> <source media="(prefers-color-scheme: dark)" srcset="https://i.imgur.com/GNJUuMB.jpg"> <source media="(prefers-color-scheme: light)" srcset="https://i.imgur.com/GNJUuMB.jpg"> <img alt="Gates of shell" src="https://i.imgur.com/GNJUuMB.jpg"> </picture>

# RESOURCES

* [Unix shell](https://en.wikipedia.org/wiki/Unix_shell)
* [Thompson shell](https://en.wikipedia.org/wiki/Thompson_shell)
* [Ken Thompson](https://en.wikipedia.org/wiki/Ken_Thompson)
* [The fork (Codevault)](https://www.youtube.com/watch?v=cex9XrZCU14&list=PLfqABt5AS4FkW5mOn2Tn9ZZLLDwA3kZUY&pp=iAQB)
* [Getenv (Portfolio cources)](https://www.youtube.com/watch?v=bB1PV9Cb98c)
* [Write your own shell (jess-inspired)](https://www.youtube.com/watch?v=cIBmeEpsMj0&list=PLxIRFba3rzLzxxZMMbrm_-mkI7mV9G0pj&pp=iAQB)
* [Building a simple-c-shell (Dr Obed)](https://blog.ehoneahobed.com/building-a-simple-shell-in-c-part-1)

## Man or help:
* `sh` (Run `sh` as well)

## Files

The project consists of the following files:

- `checker`: A script that checks the correctness of the shell's functionality by comparing its output with the expected output.
- `test_suite`: A collection of test cases to validate the shell's behavior and features.
- `AUTHORS`: A file listing the contributors and authors of the project.
- `README.md`: This file, providing an overview of the project and its files.
- `alias.c`: Contains functions related to handling aliases in the shell.
- `alias_builtin.c`: Implements the built-in command for managing aliases.
- `built_in_commands.c`: Implements various built-in commands such as `cd`, `exit`, and `env`.
- `built_in_function.c`: Contains helper functions used by the built-in commands.
- `echo.c`: Implements the `echo` command.
- `error_handler.c`: Contains error handling functions for the shell.
- `execute.c`: Handles executing non-built-in commands in the shell.
- `filename`: A file used for storing filenames during execution.
- `free.c`: Contains functions to free allocated memory in the shell.
- `getcommands.c`: Handles parsing and retrieving user commands.
- `hsh`: The compiled executable of the shell.
- `main.c`: The main entry point of the shell program.
- `main.h`: The header file containing function prototypes and global variables.
- `parse.c`: Implements parsing of user commands and arguments.
- `path_execute.c`: Handles executing commands with their full path.
- `signal.c`: Handles signal handling for the shell.
- `str_functions.c`: Contains string manipulation functions.
- `str_functions2.c`: Additional string manipulation functions.
- `test_ls_2`: A test file used for checking the behavior of the `ls` command.

## Usage

To use the shell, compile the source code and generate

## AUTHORS

* [PeterEkwere](https://github.com/PeterEkwere)
* [Hordunlarmy](https://github.com/Hordunlarmy)
