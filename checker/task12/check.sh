#!/bin/bash

chmod u+x checker.bash
chmod u+x compile

path="/root/simple_shell/hsh"

echo -e "\n\e[36m       >>>>>>>>> TASK 12 <<<<<<<<<<<\e[0m"
echo -e "\e[36m       ...........................\e[0m\n"
echo -e "\n\e[32mCheck 0. README is present and not empty\e[0m"

echo -e "\n\e[32mCheck 1. Compile program\e[0m"
./compile

if [ $? -eq 0 ]; then
	echo "OK"
fi

echo -e "\e[32mCheck 2. case: Test cmd&&cmd (no space)\e[0m"
./checker.bash $path cmd_and_cmd_no_space.bash

echo -e "\n\e[32mCheck 3. case: Test cmd && cmd\e[0m"
./checker.bash $path cmd_and_cmd.bash

echo -e "\n\e[32mCheck 4. case: Test cmd && cmd && cmd\e[0m"
./checker.bash $path cmd_and_cmd_and_cmd.bash

echo -e "\n\e[32mCheck 5. case: Test cmd && cmdfail\e[0m"
./checker.bash $path cmd_and_cmdfail.bash

echo -e "\n\e[32mCheck 6. case: Test cmd && cmdfail && cmd\e[0m"
./checker.bash $path cmd_and_cmdfail_and_cmd.bash

echo -e "\n\e[32mCheck 7. case: Test cmdfail && cmd\e[0m"
./checker.bash $path cmdfail_and_cmd.bash

echo -e "\n\e[32mCheck 8. case: Test cmd && cmd && cmdfail\e[0m"
./checker.bash $path cmd_and_cmd_and_cmdfail.bash

echo -e "\n\e[32mCheck 9. case: Test cmdfail && cmd && cmd\e[0m"
./checker.bash $path cmdfail_and_cmd_and_cmd.bash

echo -e "\n\e[32mCheck 10. case: Test cmd || cmd\e[0m"
./checker.bash $path cmd_or_cmd.bash

echo -e "\n\e[32mCheck 11. case: Test cmd || cmd || cmd\e[0m"
./checker.bash $path cmd_or_cmd_or_cmd.bash

echo -e "\n\e[32mCheck 12. case: Test cmdfail || cmd || cmd\e[0m"
./checker.bash $path cmdfail_or_cmd_or_cmd.bash

echo -e "\n\e[32mCheck 13. case: Test cmdfail||cmd (no space)\e[0m"
./checker.bash $path cmdfail_or_cmd_no_space.bash

echo -e "\n\e[32mCheck 14. case: Test cmd || cmdfail\e[0m"
./checker.bash $path cmd_or_cmdfail.bash

echo -e "\n\e[32mCheck 15. case: Test cmdfail || cmdfail\e[0m"
./checker.bash $path cmdfail_or_cmdfail.bash

echo -e "\n\e[32mCheck 16. case: Test cmd || cmdfail || cmd\e[0m"
./checker.bash $path cmd_or_cmdfail_or_cmd.bash

echo -e "\n\e[32mCheck 17. case: Test cmdfail || cmd\e[0m"
./checker.bash $path cmdfail_or_cmd.bash

echo -e "\n\e[32mCheck 18. case: Test cmdfail || cmdfail || cmdfail\e[0m"
./checker.bash $path cmdfail_or_cmdfail_or_cmdfail.bash

echo -e "\n\e[32mCheck 19. case: Test cmdfail || cmd && cmd\e[0m"
./checker.bash $path cmdfail_or_cmd_and_cmd.bash

echo -e "\n\e[32mCheck 20.  case: Test cmd && cmdfail || cmd\e[0m"
./checker.bash $path cmd_and_cmdfail_or_cmd.bash
