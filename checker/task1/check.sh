#!/bin/bash

chmod u+x checker.bash
chmod u+x compile

path="/root/simple_shell/hsh"

echo -e "\n\e[36m       >>>>>>>>> TASK 1 <<<<<<<<<<<\e[0m"
echo -e "\e[36m       ...........................\e[0m\n"
echo -e "\n\e[32mCheck 0. README is present and not empty\e[0m"

echo -e "\n\e[32mCheck 1. Compile program\e[0m"
./compile

if [ $? -eq 0 ]; then
	echo "OK"
fi

echo -e "\e[32mCheck 2. case: Execute /bin/ls\e[0m"
./checker.bash $path bin_ls.bash

echo -e "\n\e[32mCheck 3. case: Execute /bin/ls 3 times\e[0m"
./checker.bash $path bin_ls_3_times.bash

echo -e "\n\e[32mCheck 4. case: Execute /bin/ls 4 times (surrounded by spaces)\e[0m"
./checker.bash $path bin_ls_spaces.bash

echo -e "\n\e[32mCheck 5. case: Copy the file /bin/ls to hbtn_ls (in the current directory) and execute ./hbtn_ls /var\e[0m"
./checker.bash $path ls_in_current_dir.bash

echo -e "\n\e[32mCheck 6. case: Spaces only (small)\e[0m"
./checker.bash $path empty_input_small.bash

echo -e "\n\e[32mCheck 7. case: Spaces only (large)\e[0m"
./checker.bash $path empty_input_large.bash

echo -e "\n\e[32mCheck 8. case: Spaces only (medium)\e[0m"
./checker.bash $path empty_input_medium.bash
