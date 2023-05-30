#!/bin/bash

chmod u+x checker.bash
chmod u+x compile

path="/root/simple_shell/hsh"

echo -e "\n\e[36m       >>>>>>>>> TASK 11 <<<<<<<<<<<\e[0m"
echo -e "\e[36m       ...........................\e[0m\n"
echo -e "\n\e[32mCheck 0. README is present and not empty\e[0m"

echo -e "\n\e[32mCheck 1. Compile program\e[0m"
./compile

if [ $? -eq 0 ]; then
	echo "OK"
fi

echo -e "\e[32mCheck 2. case: Test cmd ; cmd ; cmd\e[0m"
./checker.bash $path cmd_sep_cmd_sep_cmd.bash

echo -e "\n\e[32mCheck 3. case: Test cmdfail ; cmd\e[0m"
./checker.bash $path cmdfail_sep_cmd.bash

echo -e "\n\e[32mCheck 4. case: Test cmdfail ; cmdfail\e[0m"
./checker.bash $path cmdfail_sep_cmdfail.bash

echo -e "\n\e[32mCheck 5. case: Test cmd;cmd (no space)\e[0m"
./checker.bash $path cmd_sep_cmd_no_space.bash

echo -e "\n\e[32mCheck 6. case: Test cmd ;\e[0m"
./checker.bash $path cmd_sep.bash

echo -e "\n\e[32mCheck 7. case: Test cmd ; cmd\e[0m"
./checker.bash $path cmd_sep_cmd.bash
