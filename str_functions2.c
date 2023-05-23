#include "main.h"
#include <stdbool.h>

void reverse(char str[], int length)
{
	int start = 0;
	int end = length - 1;

	while (start < end)
	{
		char temp = str[start];

		str[start] = str[end];
		str[end] = temp;
		start++;
		end--;
	}
}

char *_itoa(int num, char *str, int base)
{
	bool is_negative = false;
	int i = 0;

	if (base < 2 || base > 36)
	{
		*str = '\0';
		return (str);
	}

	if (num < 0)
	{
		if (base == 10)
		{
			is_negative = true;
			num = -num;
		}
		else
		{
			*str = '\0';
			return (str);
		}
	}

	while (num != 0)
	{
		int rem = num % base;

		str[i++] = (rem > 9) ? (rem - 10) + 'a' : rem + '0';
		num /= base;
	}

	if (is_negative)
		str[i++] = '-';

	str[i] = '\0';

	reverse(str, i);

	return (str);
}
