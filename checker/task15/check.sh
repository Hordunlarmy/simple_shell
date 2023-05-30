#!/bin/bash

chmod u+x checker.bash
chmod u+x compile

path="/root/simple_shell/hsh"

echo -e "\n\e[36m       >>>>>>>>> TASK 15 <<<<<<<<<<<\e[0m"
echo -e "\e[36m       ...........................\e[0m\n"
echo -e "\n\e[32mCheck 0. README is present and not empty\e[0m"

echo -e "\n\e[32mCheck 1. Compile program\e[0m"
./compile

if [ $? -eq 0 ]; then
	echo "OK"
fi

echo -e "\e[32mCheck 2. case: Execute /bin/echo #Comment (nothing should be printed)\e[0m"
./checker.bash $path comment_after_cmd.bash

echo -e "\n\e[32mCheck 3. case: Echo a string containing a # symbol inside a word (not a comment)\e[0m"
./checker.bash $path comment_after_cmd_print_no_space.bash

echo -e "\n\e[32mCheck 4. case: The command line starts with the # symbol\e[0m"
./checker.bash $path comment.bash

echo -e "\n\e[32mCheck 5. case: Echo a word followed by a comment\e[0m"
./checker.bash $path comment_after_cmd_print.bash

echo -e "\n\e[32mCheck 6. case: Echo a word followed by a comment\e[0m"
./checker.bash $path comment_after_cmd_print_space.bash
