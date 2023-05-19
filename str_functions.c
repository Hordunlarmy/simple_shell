#include "main.h"


/**
 * _strlen - Entry point
 * @s: string checked
 * Return: the length of a string.
 */
int _strlen(char *s)
{
	/* char *s = "My first strlen!"; */
	int lent;

	lent = 0;
	while (s[lent])
		lent++;
	return (lent);
}

/**
 * _strcmp - Entry point
 * @s1: pointer variable 1
 * @s2: pointer variable 2
 * Return: result of two strings compared
 */
int _strcmp(char *s1, char *s2)
{
	char *p1 = s1;
	char *p2 = s2;
	int i = 0;

	while (*(p1 + i) != '\0' && *(p2 + i) != '\0' && p1[i] == p2[i])
	{
		i++;
	}
	return (p1[i] - p2[i]);
}
