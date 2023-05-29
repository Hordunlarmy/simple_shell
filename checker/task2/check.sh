#!/bin/bash

chmod u+x checker.bash
chmod u+x compile

path="/root/simple_shell/hsh"

echo -e "\n\e[36m       >>>>>>>>> TASK 2 <<<<<<<<<<<\e[0m"
echo -e "\e[36m       ...........................\e[0m\n"
echo -e "\n\e[32mCheck 0. README is present and not empty\e[0m"

echo -e "\n\e[32mCheck 1. Compile program\e[0m"
./compile

if [ $? -eq 0 ]; then
	echo "OK"
fi

echo -e "\e[32mCheck 2. case: Execute /bin/ls -l\e[0m"
./checker.bash $path bin_ls_1_arg.bash

echo -e "\n\e[32mCheck 3. case: Execute /bin/ls /var\e[0m"
./checker.bash $path bin_ls_1_arg_1.bash

echo -e "\n\e[32mCheck 4. case: Echo the string Holberton\e[0m"
./checker.bash $path echo_1_arg.bash
