#!/bin/bash

chmod u+x checker.bash
chmod u+x compile

path="/root/simple_shell/hsh"

echo -e "\n\e[36m       >>>>>>>>> TASK 3 <<<<<<<<<<<\e[0m"
echo -e "\e[36m       ...........................\e[0m\n"
echo -e "\n\e[32mCheck 0. README is present and not empty\e[0m"

echo -e "\n\e[32mCheck 1. Compile program\e[0m"
./compile

if [ $? -eq 0 ]; then
	echo "OK"
fi

echo -e "\e[32mCheck 2. case: Execute ls\e[0m"
./checker.bash $path ls_.bash

echo -e "\n\e[32mCheck 3. case: Copy the file /bin/ls to hbtn_ls (in the parent’s parent directory) and execute ./.././../hbtn_ls /var\e[0m"
./checker.bash $path ls_in_two_parent_dir_2.bash

echo -e "\n\e[32mCheck 4. case: Execute ls -l\e[0m"
./checker.bash $path ls_1_arg.bash

echo -e "\n\e[32mCheck 5. case: Execute /bin/ls /var\e[0m"
./checker.bash $path bin_ls_1_arg_1.bash

echo -e "\n\e[32mCheck 6. case: Copy the file /bin/ls to hbtn_ls (in the parent directory) and execute ../hbtn_ls /var\e[0m"
./checker.bash $path ls_in_parent_dir.bash

echo -e "\n\e[32mCheck 7. case: Copy the file /bin/ls to hbtn_ls (in the parent’s parent directory) and execute ../../hbtn_ls /var\e[0m"
./checker.bash $path ls_in_two_parent_dir.bash

echo -e "\n\e[32mCheck 8. case: Copy the file /bin/ls to hbtn_ls (in the parent’s parent directory) and execute ./.././../////././hbtn_ls /var\e[0m"
./checker.bash $path ls_in_two_parent_dir_3.bash

echo -e "\n\e[32mCheck 9.  case: Execute /bin/ls\e[0m"
./checker.bash $path bin_ls.bash

echo -e "\n\e[32mCheck 10. case: ‘/bin’ is the last element of PATH, execute ls\e[0m"
./checker.bash $path ls_path_bin_last.bash

echo -e "\n\e[32mCheck 11. case: Execute /bin/ls (surrounded by spaces) (large)\e[0m"
./checker.bash $path bin_ls_large_input.bash

echo -e "\n\e[32mCheck 12. case: Remove the $PATH environment variable and execute /bin/ls\e[0m"
./checker.bash $path bin_ls_empty_path.bash

echo -e "\n\e[32mCheck 13. case: Execute /bin/ls -l\e[0m"
./checker.bash $path bin_ls_1_arg.bash

echo -e "\n\e[32mCheck 14. case: Execute both /bin/ls and ls several times with empty lines and leading and trailing spaces\e[0m"
./checker.bash $path mix_ls_bin_ls_spaces.bash

echo -e "\n\e[32mCheck 15. case: Execute ls 4 times (with leading and trailing spaces) case: Execute ls 4 times (with leading and trailing spaces)\e[0m"
./checker.bash $path ls_spaces.bash

echo -e "\n\e[32mCheck 16. case: Set PATH to be an empty string and execute ls\e[0m"
./checker.bash $path ls_empty_path.bash

echo -e "\n\e[32mCheck 17. case: Execute /bin/ls 4 times (surrounded by spaces)\e[0m"
./checker.bash $path bin_ls_spaces.bash

echo -e "\n\e[32mCheck 18. case: Copy the file /bin/ls to hbtn_ls (in the current directory) and execute ./hbtn_ls /var\e[0m"
./checker.bash $path ls_in_current_dir.bash

echo -e "\n\e[32mCheck 19. case: Copy file /bin/ls to .hbtnls (in the current directory), change PATH to point to PWD and execute `.hbtnls /var`\e[0m"
./checker.bash $path ls_dot_ls.bash

echo -e "\n\e[32mCheck 20. case: Remove all environment variables and execute ls\e[0m"
./checker.bash $path env_ignore_ls.bash

echo -e "\n\e[32mCheck 21. case: ‘/bin’ is the first element of PATH, execute ls\e[0m"
./checker.bash $path ls_path_bin_first.bash

echo -e "\n\e[32mCheck 22. case: Remove all environment variables and execute /bin/ls\e[0m"
./checker.bash $path env_ignore_bin_ls.bash

echo -e "\n\e[32mCheck 23. case: Execute /bin/ls 3 times\e[0m"
./checker.bash $path bin_ls_3_times.bash

echo -e "\n\e[32mCheck 24. case: Execute /bin/ls (surrounded by spaces) (medium)\e[0m"
./checker.bash $path bin_ls_medium_input.bash

echo -e "\n\e[32mCheck 25. case: Execute /bin/ls and ls several times\e[0m"
./checker.bash $path mix_ls_bin_ls.bash

echo -e "\n\e[32mCheck 26. case: PATH does not contain ‘/bin’, execute ls\e[0m"
./checker.bash $path ls_path_no_bin.bash

echo -e "\n\e[32mCheck 27. case: ‘/bin’ is in the middle of PATH, execute ls\e[0m"
./checker.bash $path ls_path_bin_middle.bash

echo -e "\n\e[32mCheck 28. case: Set PATH to be an empty string and execute a command that does not exist\e[0m"
./checker.bash $path empty_path_failing_cmd.bash

echo -e "\n\e[32mCheck 29. case: Remove PATH variable and set a PATH1 variable, and execute ls\e[0m"
./checker.bash $path path_path1_var.bash

echo -e "\n\e[32mCheck 30. case: Copy the file /bin/ls to hbtn_ls (in the current directory), set the PATH to PWD, and execute hbtn_ls /var\e[0m"
./checker.bash $path path_current_dir_ls.bash

echo -e "\n\e[32mCheck 31. case: fork should not be called when a command does not exist\e[0m"
./checker.bash $path unknown_command_no_fork.bash
