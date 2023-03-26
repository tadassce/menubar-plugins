#!/bin/bash

# <bitbar.title>Timezones+</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Aaron Edell</bitbar.author>
# <bitbar.author.github>aaronedell</bitbar.author.github>
# <bitbar.desc>Rotates current time through four common timezones </bitbar.desc>
# <bitbar.image>http://i.imgur.com/Y4nhdZo.png</bitbar.image>
# <bitbar.dependencies>Bash GNU AWK</bitbar.dependencies>

# berlin="$(TZ=':Europe/Berlin' date +'%H:%M')"
# alaska="$(TZ=':US/Alaska' date +'%H:%M')"
vancouver="$(TZ=':US/Pacific' date +'%H:%M')"
toronto="$(TZ=':America/Toronto' date +'%H:%M')"
warsaw="$(TZ=':Europe/Warsaw' date +'%H:%M')"
london="$(TZ=':Europe/London' date +'%H:%M')"

# echo "$vancouver — $toronto —— $warsaw — $london"
echo "$toronto"
echo "---"
echo "$vancouver PST Vancouver"
echo "$toronto EST Toronto"
echo "$warsaw CET Warsaw"
echo "$london UTC London"

# echo -n "Vancouver "; TZ=":US/Pacific" date +'%H:%M'
# echo -n "Toronto "; TZ=":America/Toronto" date +'%H:%M'
# echo -n "Warsaw "; TZ=":Europe/Warsaw" date +'%H:%M'
# echo -n "London " ; TZ=":Europe/London" date +'%H:%M'

