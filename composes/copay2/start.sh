#!/bin/bash
printf "\n\e[92m >> S T A R T << \x1b[0m\n"

grunt

npm start

tail -n 50 /copay/npm-debug.log
#find / -type d -name '.npm'

#cd /copay
#
#npm start
#
##echo `node -v`
printf "\n\n"