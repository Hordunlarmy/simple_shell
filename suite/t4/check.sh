#!/bin/bash

chmod u+x checker.bash
echo -e "\e[35m                   >>>>>>>>> TASK 4 <<<<<<<<<<<\e[0m"
echo -e "\e[35m                   .............................\e[0m\n"
echo -e "\n\e[32mCheck 0. README is present and not empty\e[0m"

echo -e "\n\e[32mCheck 1. Compile program\e[0m"

echo -e "\n\e[32mCheck 2. Exit without parameter\e[0m"
./checker.bash ~/simple_shell/hsh exit_no_arg.bash

echo -e "\n\e[32mCheck 3. case: Execute a command that fails, and exit without parameter\e[0m"
./checker.bash ~/simple_shell/hsh exit_no_arg_1.bash
