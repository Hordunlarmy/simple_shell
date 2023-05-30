#!/bin/bash

chmod u+x checker.bash
chmod u+x compile

path="/root/simple_shell/hsh"

echo -e "\n\e[36m       >>>>>>>>> TASK 10 <<<<<<<<<<<\e[0m"
echo -e "\e[36m       ...........................\e[0m\n"
echo -e "\n\e[32mCheck 0. README is present and not empty\e[0m"

echo -e "\n\e[32mCheck 1. Compile program\e[0m"
./compile

if [ $? -eq 0 ]; then
	echo "OK"
fi

echo -e "\e[32mCheck 2. case: Execute cd without parameter\e[0m"
./checker.bash $path cd_no_arg.bash

echo -e "\n\e[32mCheck 3. case: Remove $HOME and execute cd without parameter\e[0m"
./checker.bash $path cd_no_arg_rm_home.bash

echo -e "\n\e[32mCheck 4. case: Try to cd /root (without permission)\e[0m"
./checker.bash $path cd_no_permission.bash

echo -e "\n\e[32mCheck 5. case: Remove OLDPWD and execute cd -\e[0m"
./checker.bash $path cd_dash_rm_oldpwd.bash

echo -e "\n\e[32mCheck 6. case: Cd to /tmp, then to dev and execute cd -\e[0m"
./checker.bash $path cd_dash.bash

echo -e "\n\e[32mCheck 7. case: Execute cd /tmp\e[0m"
./checker.bash $path cd_normal.bash

echo -e "\n\e[32mCheck 8. case: Try to cd /hbtn (Folder does not exist)\e[0m"
./checker.bash $path cd_not_existing_dir.bash

echo -e "\n\e[32mCheck 9. case: Set the variable OLDPWD to /tmp and execute cd -\e[0m"
./checker.bash $path cd_dash_change_oldpwd.bash

echo -e "\n\e[32mCheck 10. case: Set $HOME to /tmp and execute cd without parameter\e[0m"
./checker.bash $path cd_no_arg_change_home.bash
