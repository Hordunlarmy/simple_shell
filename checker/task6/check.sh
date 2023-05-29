#!/bin/bash

chmod u+x checker.bash
chmod u+x compile

path="/root/simple_shell/hsh"

echo -e "\n\e[36m       >>>>>>>>> TASK 6 <<<<<<<<<<<\e[0m"
echo -e "\e[36m       ...........................\e[0m\n"
echo -e "\n\e[32mCheck 0. README is present and not empty\e[0m"

echo -e "\n\e[32mCheck 1. Compile program\e[0m"
./compile

if [ $? -eq 0 ]; then
	echo "OK"
fi

echo -e "\e[32mCheck 2. case: Execute /bin/ls\e[0m"
./checker.bash $path bin_ls.bash

echo -e "\n\e[32mCheck 3. case: Execute /bin/ls (surrounded by spaces) (medium)\e[0m"
./checker.bash $path bin_ls_medium_input.bash

echo -e "\n\e[32mCheck 4. case: Execute /bin/ls (surrounded by spaces) (large)\e[0m"
./checker.bash $path bin_ls_large_input.bash
