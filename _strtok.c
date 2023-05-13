#include "main.h"
/**
 * _strtok - is a function that tokenize a string
 * @str: is a an array of strings
 * @delim: is a string delimeter
 * Return: an int
 */
char *_strtok(char *str, const char *delim)
{
	char *token;

	token = strtok(str, delim);
	return (token);
}
