#!/bin/bash

chmod u+x checker.bash
chmod u+x compile

path="/root/simple_shell/hsh"

echo -e "\n\e[36m       >>>>>>>>> TASK  <<<<<<<<<<<\e[0m"
echo -e "\e[36m       ...........................\e[0m\n"
echo -e "\n\e[32mCheck 0. README is present and not empty\e[0m"

echo -e "\n\e[32mCheck 1. Compile program\e[0m"
./compile

if [ $? -eq 0 ]; then
	echo "OK"
fi

echo -e "\e[32mCheck 2. \e[0m"
./checker.bash $path 

echo -e "\n\e[32mCheck 3. \e[0m"
./checker.bash $path 

echo -e "\n\e[32mCheck 4. \e[0m"
./checker.bash $path 

echo -e "\n\e[32mCheck 5. \e[0m"
./checker.bash $path 

echo -e "\n\e[32mCheck 6. \e[0m"
./checker.bash $path 

echo -e "\n\e[32mCheck 7. \e[0m"
./checker.bash $path 

echo -e "\n\e[32mCheck 8. \e[0m"
./checker.bash $path 

echo -e "\n\e[32mCheck 9. \e[0m"
./checker.bash $path 
