#!/bin/bash

# Usage : ./check.sh | less -r
# copy this file inside your project folder and run ./checker.sh | less -r

gcc -Wall -Werror -Wextra -pedantic -std=gnu89 *.c -o hsh

function run_check() {
    echo "--> [" $1 "] <--"
    chars1=$(wc -m <1a2b3c4d5e6f7g8h9i)
    chars2=$(wc -m <1a2b3c4d5e6f7g8h9b)
    if diff 1a2b3c4d5e6f7g8h9i 1a2b3c4d5e6f7g8h9b >/dev/null; then
        echo -e "\e[32mSuccess\e[0m"
    else
        echo -e "\e[31mFailed\e[0m"
        echo -e "\e[0m[Got]\e[31m"
        cat 1a2b3c4d5e6f7g8h9i
        echo -e "\e[0m[" $chars1 "Chars]\e[31m"
        echo -e "\e[0m[Expected]\e[31m"
        cat 1a2b3c4d5e6f7g8h9b
        echo -e "\e[0m[" $chars2 "Chars]\e[0m"
    fi
    rm 1a2b3c4d5e6f7g8h9i 1a2b3c4d5e6f7g8h9b
    echo "************************************"
}

######### case 1
command1=$(echo "ls" | ./hsh 2>&1)
command2=$(echo "ls" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "ls"

######### case 2
command1=$(echo "/bin/ls" | ./hsh 2>&1)
command2=$(echo "/bin/ls" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "/bin/ls"

######### case 3
command1=$(echo "/bin/ls -l" | ./hsh 2>&1)
command2=$(echo "/bin/ls -l" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "ls with -l option"

######### case 4
command1=$(echo "/bin/ls -l /tmp" | ./hsh 2>&1)
command2=$(echo "/bin/ls -l /tmp" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "ls with -l and /tmp option"

######### case 5
command1=$(echo "    /bin/ls" | ./hsh 2>&1)
command2=$(echo "    /bin/ls" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "ls with spaces before"

######### case 6
command1=$(echo "/bin/ls   " | ./hsh 2>&1)
command2=$(echo "/bin/ls   " | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "/bin/ls with spaces after"

######### case 7
command1=$(echo "   /bin/ls   " | ./hsh 2>&1)
command2=$(echo "   /bin/ls   " | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "/bin/ls with spaces before and after"

######### case 8
command1=$(echo "echo hello world" | ./hsh 2>&1)
command2=$(echo "echo hello world" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "echo"

######### case 9
command1=$(echo "/bin/ls /home /usr" | ./hsh 2>&1)
command2=$(echo "/bin/ls /home /usr" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "/bin/ls multiple dir"

######### case 10
command1=$(echo "ls /home /usr" | ./hsh 2>&1)
command2=$(echo "ls /home /usr" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "ls multiple dir"

######### case 11
command1=$(echo "ls /home /usr /bin /home" | ./hsh 2>&1)
command2=$(echo "ls /home /usr /bin /home" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "ls multiple dir"

######### case 12
command1=$(echo "ls /homezzz" | ./hsh 2>&1)
command2=$(echo "ls /homezzz" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "ls non-existing dir"

######### case 13
command1=$(echo "mkdir my_testDir22" | ./hsh 2>&1)
command2=$(echo "mkdir my_testDir23" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "mkdir"

######### case 14
command1=$(echo "rmdir my_testDir22" | ./hsh 2>&1)
command2=$(echo "rmdir my_testDir23" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "rmdir"

######### case 15
command1=$(echo "exit" | ./hsh 2>&1)
command2=$(echo "exit" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "exit"

######### case 16
command1=$(echo "" | ./hsh 2>&1)
command2=$(echo "" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "empty line"

######### case 17
command1=$(echo "   " | ./hsh 2>&1)
command2=$(echo "   " | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "spaces line"

######### case 15
command1=$(echo "./RUNME" | ./hsh 2>&1)
command2=$(echo "./RUNME" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "run exe in cwd"

rm ./RUNME

######### case 18
command1=$(echo "ls -l" | ./hsh 2>&1)
command2=$(echo "ls -l" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "ls with options"

######### case 19
command1=$(echo "echo DoingHardThings#" | ./hsh 2>&1)
command2=$(echo "echo DoingHardThings#" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "echo command"

######### case 20
command1=$(echo "pwd" | ./hsh 2>&1)
command2=$(echo "pwd" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "pwd command"

######### case 21
command1=$(echo "cat file.txt" | ./hsh 2>&1)
command2=$(echo "cat file.txt" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "cat command with existing file"

######### case 22
command1=$(echo "cat non_existing_file.txt" | ./hsh 2>&1)
command2=$(echo "cat non_existing_file.txt" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "cat command with non-existing file"

######### case 23
command1=$(echo "grep 'pattern' file.txt" | ./hsh 2>&1)
command2=$(echo "grep 'pattern' file.txt" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "grep command with existing file"

######### case 24
command1=$(echo "grep 'pattern' non_existing_file.txt" | ./hsh 2>&1)
command2=$(echo "grep 'pattern' non_existing_file.txt" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "grep command with non-existing file"

######### case 25
command1=$(echo "echo $HOME" | ./hsh 2>&1)
command2=$(echo "echo $HOME" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "environment variable expansion"

######### case 26
command1=$(echo "ls -l | grep 'file'" | ./hsh 2>&1)
command2=$(echo "ls -l | grep 'file'" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "piping commands (ls -l | grep 'file')"

######### case 27
command1=$(echo "ls /non_existing_dir | grep 'file'" | ./hsh 2>&1)
command2=$(echo "ls /non_existing_dir | grep 'file'" | sh 2>&1)
echo "$command1" >1a2b3c4d5e6f7g8h9i
echo "$command2" >1a2b3c4d5e6f7g8h9b
run_check "piping commands with non-existing directory"

######### case 28
command1=$(echo "echo \"qwerty\" | /bin/sh" | ./hsh 2>&1)
command2=$(echo "echo \"qwerty\" | /bin/sh" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "execute command with input using /bin/sh"

######### case 29
command1=$(echo "echo \"qwerty\" | /bin/../bin/sh" | ./hsh 2>&1)
command2=$(echo "echo \"qwerty\" | /bin/../bin/sh" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "execute command with input using /bin/../bin/sh"

######### case 30
command1=$(echo "echo \"/bin/ls\" | ./hsh" | ./hsh 2>&1)
command2=$(echo "echo \"/bin/ls\" | ./hsh" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "execute command with input using ./hsh"

######### case 31
command1=$(echo "cat test_ls_2" | ./hsh 2>&1)
command2=$(echo "cat test_ls_2" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "execute cat command with file input"

######### case 32
command1=$(cat test_ls_2 | ./hsh 2>&1)
command2=$(cat test_ls_2 | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "execute hsh with file input"

######### case 33
command1=$(echo "env" | ./hsh 2>&1)
command2=$(echo "env" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "execute env command"

######### case 34
command1=$(echo "exit" | ./hsh 2>&1)
command2=$(echo "exit" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "execute exit command"

######### case 35
command1=$(echo "" | ./hsh 2>&1)
command2=$(echo "" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "execute empty command"

######### case 36
command1=$(echo "julien@ubuntu:~/shell$" | ./hsh 2>&1)
command2=$(echo "julien@ubuntu:~/shell$" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "execute shell prompt"

######### case 37
command1=$(echo "exit 98" | ./hsh 2>&1)
command2=$(echo "exit 98" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "execute exit command with exit code 98"

######### case 38
command1=$(echo "echo \$?" | ./hsh 2>&1)
command2=$(echo "echo \$?" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "execute echo \$? command"

######### case 39
command1=$(echo "exit" | ./hsh 2>&1)
command2=$(echo "exit" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "execute exit command without exit code"

######### case 40
command1=$(echo "echo \$?" | ./hsh 2>&1)
command2=$(echo "echo \$?" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "execute echo \$? command after exiting"

######### case 41
command1=$(echo "echo \$SHELL" | ./hsh 2>&1)
command2=$(echo "echo \$SHELL" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "execute echo \$SHELL command"

######### case 42
command1=$(echo "setenv VAR1 value1" | ./hsh 2>&1)
command2=$(echo "setenv VAR1 value1" | env -i ./hsh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "setenv command: create a new variable"

######### case 43
command1=$(echo "setenv VAR1 value1" | ./hsh 2>&1)
command2=$(echo "setenv VAR1 value2" | ./hsh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "setenv command: modify an existing variable"

######### case 44
command1=$(echo "setenv VAR1 value1" | ./hsh 2>&1)
command2=$(echo "unsetenv VAR1" | ./hsh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "unsetenv command: remove an existing variable"

######### case 45
command1=$(echo "unsetenv VAR1" | ./hsh 2>&1)
command2=$(echo "unsetenv VAR1" | env -i ./hsh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "unsetenv command: remove a non-existing variable"

######### case 46
command1=$(echo "cd" | ./hsh 2>&1)
command1=$(echo "cd" | /bin/sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "cd command: without argument (cd $HOME)"

######### case 47
command1=$(echo "cd /tmp" | ./hsh 2>&1)
command1=$(echo "cd /tmp" | /bin/sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "cd command: with absolute path"

######### case 48
command1=$(echo "cd ." | ./hsh 2>&1)
command1=$(echo "cd ." | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "cd command: with relative path (.)"

######### case 49
command1=$(echo "cd .." | ./hsh 2>&1)
command1=$(echo "cd .." | /bin/sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "cd command: with relative path (..)"

######### case 50
command1=$(echo "cd /path/to/nonexistent" | ./hsh 2>&1)
command1=$(echo "cd /path/to/nonexistent" | /bin/sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "cd command: with non-existing directory"

######### case 51
command1=$(echo "cd -" | ./hsh 2>&1)
command1=$(echo "cd -" | /bin/sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "cd command: with '-' (change to previous directory)"

######### case 52
command1=$(echo "ls /var ; ls /var" | ./hsh 2>&1)
command2=$(echo "ls /var ; ls /var" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Multiple commands: 'ls /var ; ls /var'"

######### case 53
command1=$(echo "ls /hbtn ; ls /var" | ./hsh 2>&1)
command2=$(echo "ls /hbtn ; ls /var" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Multiple commands: 'ls /hbtn ; ls /var'"

######### case 54
command1=$(echo "ls /var ; ls /hbtn" | ./hsh 2>&1)
command2=$(echo "ls /var ; ls /hbtn" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Multiple commands: 'ls /var ; ls /hbtn'"

######### case 55
command1=$(echo "ls /var ; ls /hbtn ; ls /var ; ls /var" | ./hsh 2>&1)
command2=$(echo "ls /var ; ls /hbtn ; ls /var ; ls /var" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Multiple commands: 'ls /var ; ls /hbtn ; ls /var ; ls /var'"

######### case 56
command1=$(echo "ls /var && ls /var" | ./hsh 2>&1)
command2=$(echo "ls /var && ls /var" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Logical AND operator: 'ls /var && ls /var'"

######### case 57
command1=$(echo "ls /hbtn && ls /var" | ./hsh 2>&1)
command2=$(echo "ls /hbtn && ls /var" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Logical AND operator: 'ls /hbtn && ls /var'"

######### case 58
command1=$(echo "ls /var && ls /var && ls /var && ls /hbtn" | ./hsh 2>&1)
command2=$(echo "ls /var && ls /var && ls /var && ls /hbtn" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Logical AND operator: 'ls /var && ls /var && ls /var && ls /hbtn'"

######### case 59
command1=$(echo "ls /var && ls /var && ls /var && ls /hbtn && ls /hbtn" | ./hsh 2>&1)
command2=$(echo "ls /var && ls /var && ls /var && ls /hbtn && ls /hbtn" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Logical AND operator: 'ls /var && ls /var && ls /var && ls /hbtn && ls /hbtn'"

######### case 60
command1=$(echo "ls /var || ls /var" | ./hsh 2>&1)
command2=$(echo "ls /var || ls /var" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Logical OR operator: 'ls /var || ls /var'"

######### case 61
command1=$(echo "ls /hbtn || ls /var" | ./hsh 2>&1)
command2=$(echo "ls /hbtn || ls /var" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Logical OR operator: 'ls /hbtn || ls /var'"

######### case 62
command1=$(echo "ls /hbtn || ls /hbtn || ls /hbtn || ls /var" | ./hsh 2>&1)
command2=$(echo "ls /hbtn || ls /hbtn || ls /hbtn || ls /var" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Logical OR operator: 'ls /hbtn || ls /hbtn || ls /hbtn || ls /var'"

######### case 63
command1=$(echo "ls /hbtn || ls /hbtn || ls /hbtn || ls /var || ls /var" | ./hsh 2>&1)
command2=$(echo "ls /hbtn || ls /hbtn || ls /hbtn || ls /var || ls /var" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Logical OR operator: 'ls /hbtn || ls /hbtn || ls /hbtn || ls /var || ls /var'"

######### case 64
command1=$(echo "ls /var || echo \$?" | ./hsh 2>&1)
command2=$(echo "ls /var || echo \$?" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Logical OR operator with echo: 'ls /var || echo \$?'"

######### case 65
command1=$(echo "ls /var && echo \$?" | /bin/sh 2>&1)
command2=$(echo "ls /var && echo \$?" | ./hsh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Logical AND operator with echo: 'ls /var && echo \$?'"

######### case 66
command1=$(echo "ls /var || ls /hbtn && ls /var" | ./hsh 2>&1)
command2=$(echo "ls /var || ls /hbtn && ls /var" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Mixed operators: 'ls /var || ls /hbtn && ls /var'"

######### case 67
command1=$(echo "ls /var && ls /hbtn || ls /var" | ./hsh 2>&1)
command2=$(echo "ls /var && ls /hbtn || ls /var" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Mixed operators: 'ls /var && ls /hbtn || ls /var'"

######### case 68
command1=$(echo "ls /hbtn && ls /var || ls /var" | ./hsh 2>&1)
command2=$(echo "ls /hbtn && ls /var || ls /var" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Mixed operators: 'ls /hbtn && ls /var || ls /var'"

######### case 69
command1=$(echo "echo Hello World # This is a comment" | ./hsh 2>&1)
command2=$(echo "echo Hello World # This is a comment" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Command with comment: 'echo Hello World # This is a comment'"

######### case 70
command1=$(echo "echo Hello #World" | ./hsh 2>&1)
command2=$(echo "echo Hello #World" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Command with comment in the middle: 'echo Hello #World'"

######### case 71
command1=$(echo "echo Hello World # This is a comment" | ./hsh 2>&1)
command2=$(echo "echo Hello World # This is a comment" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Command with comment: 'echo Hello World # This is a comment'"

######### case 72
command1=$(echo "echo Hello World#This is a comment" | ./hsh 2>&1)
command2=$(echo "echo Hello World#This is a comment" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Command with comment without space: 'echo Hello World#This is a comment'"

######### case 73
command1=$(echo "# Comment only" | ./hsh 2>&1)
command2=$(echo "# Comment only" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Comment only: '# Comment only'"

######### case 74
command1=$(echo "echo Hello # World" | ./hsh 2>&1)
command2=$(echo "echo Hello # World" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Command with comment: 'echo Hello # World'"

######### case 75
command1=$(echo "echo Hello#World # Comment" | ./hsh 2>&1)
command2=$(echo "echo Hello#World # Comment" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Command with comment and comment after: 'echo Hello#World # Comment'"

######### case 76
command1=$(echo "alias" | ./hsh 2>&1)
command2=$(echo "alias" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Print all aliases: 'alias'"

######### case 77
command1=$(echo "alias name1 name2" | ./hsh 2>&1)
command2=$(echo "alias name1 name2" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Print aliases: 'alias name1 name2'"

######### case 78
command1=$(echo "alias name1=value1 name2=value2" | ./hsh 2>&1)
command2=$(echo "alias name1=value1 name2=value2" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Define aliases: 'alias name1=value1 name2=value2'"

######### case 79
command1=$(echo "alias name1=value1 name2=value2 name3=value3" | ./hsh 2>&1)
command2=$(echo "alias name1=value1 name2=value2 name3=value3" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Define aliases: 'alias name1=value1 name2=value2 name3=value3'"

######### case 80
command1=$(echo "alias name1=value1 name2 name3" | ./hsh 2>&1)
command2=$(echo "alias name1=value1 name2 name3" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Print aliases and define aliases: 'alias name1=value1 name2 name3'"

######### case 81
command1=$(echo "alias name1=value1 name2=value2; alias" | ./hsh 2>&1)
command2=$(echo "alias name1=value1 name2=value2; alias" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Define aliases and print all aliases: 'alias name1=value1 name2=value2; alias'"

######### case 82
command1=$(echo "alias name1=value1 name2=value2; alias name1 name2" | ./hsh 2>&1)
command2=$(echo "alias name1=value1 name2=value2; alias name1 name2" | sh 2>&1)
echo "$command1" > 1a2b3c4d5e6f7g8h9i
echo "$command2" > 1a2b3c4d5e6f7g8h9b
run_check "Define aliases and print specific aliases: 'alias name1=value1 name2=value2; alias name1 name2'"


#>>>> betty testing  <<<<<<

#remove the hashs below to enable betty testing

#echo "-->" Check documentation
#betty-doc *.c *.h
#echo "-->" Check style
#betty-style *.c *.h
