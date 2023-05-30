#!/bin/bash

chmod u+x checker.bash
chmod u+x compile

path="/root/simple_shell/hsh"

echo -e "\n\e[36m       >>>>>>>>> TASK 13 <<<<<<<<<<<\e[0m"
echo -e "\e[36m       ...........................\e[0m\n"
echo -e "\n\e[32mCheck 0. README is present and not empty\e[0m"

echo -e "\n\e[32mCheck 1. Compile program\e[0m"
./compile

if [ $? -eq 0 ]; then
	echo "OK"
fi

echo -e "\e[32mCheck 2. case: Set an alias to /bin/ls and call ‘alias’ to display the alias list\e[0m"
./checker.bash $path alias_list.bash

echo -e "\n\e[32mCheck 3. case: Set an alias to /bin/ls and an alias to this alias, then call the second alias\e[0m"
./checker.bash $path alias_ls_double.bash

echo -e "\n\e[32mCheck 4. case: Set three aliases using alias alias1=value1 alias2=value2 ... and display them using alias\e[0m"
./checker.bash $path alias_several.bash

echo -e "\n\e[32mCheck 5. case: Set three aliases and display two of them using alias alias1 alias2\e[0m"
./checker.bash $path alias_specific.bash

echo -e "\n\e[32mCheck 6. case: Set aliases and display in the same command using alias alias1=value1 alias2 alias3=value3 ...\e[0m"
./checker.bash $path alias_several_and_display.bash

echo -e "\n\e[32mCheck 7. case: Set an alias to /bin/ls and call it\e[0m"
./checker.bash $path alias_ls.bash

echo -e "\n\e[32mCheck 8. case: Set one alias using alias alias1=value1 alias1=value2 ... and display it using alias\e[0m"
./checker.bash $path alias_several_override.bash

echo -e "\n\e[32mCheck 9. case: Set an alias twice to test that it is overwritten\e[0m"
./checker.bash $path alias_overwrite.bash
