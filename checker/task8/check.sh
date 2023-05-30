#!/bin/bash

chmod u+x checker.bash
chmod u+x compile

path="/root/simple_shell/hsh"

echo -e "\n\e[36m       >>>>>>>>> TASK 8 <<<<<<<<<<<\e[0m"
echo -e "\e[36m       ...........................\e[0m\n"
echo -e "\n\e[32mCheck 0. README is present and not empty\e[0m"

echo -e "\n\e[32mCheck 1. Compile program\e[0m"
./compile

if [ $? -eq 0 ]; then
	echo "OK"
fi

echo -e "\e[32mCheck 2. case: Exit with the status 1000\e[0m"
./checker.bash $path exit_1000.bash

echo -e "\n\e[32mCheck 3. case: Exit with the number 98 as parameter\e[0m"
./checker.bash $path exit_with_status.bash

echo -e "\n\e[32mCheck 4. case: Exit with a negative number\e[0m"
./checker.bash $path exit_neg_number.bash

echo -e "\n\e[32mCheck 5. case: Execute a command that fails, and exit without parameter\e[0m"
./checker.bash $path exit_no_arg_1.bash

echo -e "\n\e[32mCheck 6. case: Exit without parameter\e[0m"
./checker.bash $path exit_no_arg.bash

echo -e "\n\e[32mCheck 7. case: Exit with a string as parameter\e[0m"
./checker.bash $path exit_string.bash
