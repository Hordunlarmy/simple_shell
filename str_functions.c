#include "main.h"


/**
 * _strlen - Entry point
 * @s: string checked
 * Return: the length of a string.
 */
int _strlen(const char *s)
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
int _strcmp(const char *s1, const char *s2)
{
	const char *p1 = s1;
	const char *p2 = s2;
	int i = 0;

	while (*(p1 + i) != '\0' && *(p2 + i) != '\0' && p1[i] == p2[i])
	{
		i++;
	}
	return (p1[i] - p2[i]);
}


/**
 * _strchr - Entry point
 * @s: pointer variable
 * @c: character to be checked
 * Return: Always 0 (Success)
 */
char *_strchr(const char *s, const char c)
{
	const char *p = s;
	const char *pp = &c;
	int i;

	for (i = 0; *(p + i) != '\0'; i++)

		if (*(p + i) == *pp)
		{
			return ((char *)(s + i));
		}

	return (0);
}
