#!/bin/bash

# <bitbar.title>Timezones+</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Aaron Edell</bitbar.author>
# <bitbar.author.github>aaronedell</bitbar.author.github>
# <bitbar.desc>Rotates current time through four common timezones </bitbar.desc>
# <bitbar.image>http://i.imgur.com/Y4nhdZo.png</bitbar.image>
# <bitbar.dependencies>Bash GNU AWK</bitbar.dependencies>
# <swiftbar.hideAbout>true</swiftbar.hideAbout>
# <swiftbar.hideRunInTerminal>true</swiftbar.hideRunInTerminal>
# <swiftbar.hideLastUpdated>true</swiftbar.hideLastUpdated>
# <swiftbar.hideDisablePlugin>true</swiftbar.hideDisablePlugin>
# <swiftbar.hideSwiftBar>true</swiftbar.hideSwiftBar>

# berlin="$(TZ=':Europe/Berlin' date +'%H:%M')"
# alaska="$(TZ=':US/Alaska' date +'%H:%M')"
vancouver="$(TZ=':US/Pacific' date +'%H:%M')"
toronto="$(TZ=':America/Toronto' date +'%H:%M')"
newfoundland="$(TZ=':America/St_Johns' date +'%H:%M')"
london="$(TZ=':Europe/London' date +'%H:%M')"
warsaw="$(TZ=':Europe/Warsaw' date +'%H:%M')"
# bangalore="$(TZ=':Asia/Kolkata' date +'%H:%M')"

# echo "$vancouver — $toronto —— $warsaw — $london"
echo "$toronto"
echo "---"
echo "$vancouver California"
echo "$toronto Ottawa"
echo "$newfoundland Newfoundland"
echo "$london London"
echo "$warsaw Warsaw"
# echo "$bangalore Bangalore"

# echo -n "Vancouver "; TZ=":US/Pacific" date +'%H:%M'
# echo -n "Toronto "; TZ=":America/Toronto" date +'%H:%M'
# echo -n "Warsaw "; TZ=":Europe/Warsaw" date +'%H:%M'
# echo -n "London " ; TZ=":Europe/London" date +'%H:%M'

