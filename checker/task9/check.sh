#!/bin/bash

chmod u+x checker.bash
chmod u+x compile

path="/root/simple_shell/hsh"

echo -e "\n\e[36m       >>>>>>>>> TASK 9 <<<<<<<<<<<\e[0m"
echo -e "\e[36m       ...........................\e[0m\n"
echo -e "\n\e[32mCheck 0. README is present and not empty\e[0m"

echo -e "\n\e[32mCheck 1. Compile program\e[0m"
./compile

if [ $? -eq 0 ]; then
	echo "OK"
fi

echo -e "\e[32mCheck 2. case: Execute setenv HBTN (only one parameter) and display the environment\e[0m"
./checker.bash $path setenv_one_param.bash

echo -e "\n\e[32mCheck 3. case: Execute setenv without parameter and display the environment\e[0m"
./checker.bash $path setenv_no_param.bash

echo -e "\n\e[32mCheck 4. case: Display the environment, setenv an existing variable, and display again\e[0m"
./checker.bash $path setenv_existing_var.bash

echo -e "\n\e[32mCheck 5. case: Display the environment, set a new variable using setenv, and display the environment again\e[0m"
./checker.bash $path setenv.bash

echo -e "\n\e[32mCheck 6. case: Display the environment, unset an existing environment variable using unsetenv and display the environment again\e[0m"
./checker.bash $path unsetenv.bash

echo -e "\n\e[32mCheck 7. case: Display the environment, unset a not-existing environment variable using unsetenv and display the environment again\e[0m"
./checker.bash $path unsetenv_not_existing_var.bash

echo -e "\n\e[32mCheck 8. case: Execute unsetenv (without parameter) and display the environment\e[0m"
./checker.bash $path unsetenv_no_param.bash
