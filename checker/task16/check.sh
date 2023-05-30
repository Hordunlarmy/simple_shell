#!/bin/bash

chmod u+x checker.bash
chmod u+x compile

path="/root/simple_shell/hsh"

echo -e "\n\e[36m       >>>>>>>>> TASK 16 <<<<<<<<<<<\e[0m"
echo -e "\e[36m       ...........................\e[0m\n"
echo -e "\n\e[32mCheck 0. README is present and not empty\e[0m"

echo -e "\n\e[32mCheck 1. Compile program\e[0m"
./compile

if [ $? -eq 0 ]; then
	echo "OK"
fi

echo -e "\e[32mCheck 2. case: ./hsh file where file does not exist\e[0m"
./checker.bash $path shell_with_unknown_file.bash

echo -e "\n\e[32mCheck 3. case: ./hsh file where file is empty\e[0m"
./checker.bash $path shell_with_empty_file.bash

echo -e "\n\e[32mCheck 4. case: ./hsh file where file contains echo hbtn\e[0m"
./checker.bash $path shell_with_file.bash

echo -e "\n\e[32mCheck 5. case: ./hsh file where file contains several /bin/ls and empty lines\e[0m"
./checker.bash $path shell_with_file_1.bash
