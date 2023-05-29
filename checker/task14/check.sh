#!/bin/bash

chmod u+x checker.bash

path="/root/simple_shell/hsh"

echo -e "\e[36m                   >>>>>>>>> TASK 14 <<<<<<<<<<<\e[0m"
echo -e "\e[36m                   .............................\e[0m\n"
echo -e "\n\e[32mCheck 0. README is present and not empty\e[0m"

echo -e "\n\e[32mCheck 1. Compile program\e[0m"

echo -e "\n\e[32mCheck 2. case: Execute a command that fails, and display its status with echo $?\e[0m"
./checker.bash $path echo_status_fail.bash

echo -e "\n\e[32mCheck 3. case: Execute /bin/ls $HBTN_DIR where HBTN_DIR is “/var”\e[0m"
./checker.bash $path ls_var.bash

echo -e "\n\e[32mCheck 4. case: Execute a command that succeeds and display its status with echo $?\e[0m"
./checker.bash $path echo_status.bash

echo -e "\n\e[32mCheck 5. case: Set the variable HBTN_ECHO to be /bin/echo, and execute $HTBN_ECHO hbtn\e[0m"
./checker.bash $path echo_as_var.bash

echo -e "\n\e[32mCheck 6. case: Execute echo $HBTN_UNDEF where HBTN_UNDER does not exist\e[0m"
./checker.bash $path echo_unknown_var.bash

echo -e "\n\e[32mCheck 7. case: Display shell PID with echo $$\e[0m"
./checker.bash $path echo_pid.bash

echo -e "\n\e[32mCheck 8. case: Execute echo 3 times, one of them with $ $ (no variable)\e[0m"
./checker.bash $path echo_pid_fake.bash

echo -e "\n\e[32mCheck 9. case: Execute echo $HBTN_VAR where HBTN_VAR contains a string\e[0m"
./checker.bash $path echo_var.bash
