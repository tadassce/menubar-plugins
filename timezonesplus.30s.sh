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

day="$(date +'%a %b %d, %Y')"
sanfrancisco="$(TZ=':America/Los_Angeles' date +'%H:%M')"
# berlin="$(TZ=':Europe/Berlin' date +'%H:%M')"
# alaska="$(TZ=':US/Alaska' date +'%H:%M')"
vancouver="$(TZ=':US/Pacific' date +'%H:%M')"
calgary="$(TZ=':America/Denver' date +'%H:%M')"
chicago="$(TZ=':America/Chicago' date +'%H:%M')"
toronto="$(TZ=':America/Toronto' date +'%H:%M')"
newyork="$(TZ=':America/New_York' date +'%H:%M')"
newfoundland="$(TZ=':America/St_Johns' date +'%H:%M')"
london="$(TZ=':Europe/London' date +'%H:%M')"
berlin="$(TZ=':Europe/Berlin' date +'%H:%M')"
warsaw="$(TZ=':Europe/Warsaw' date +'%H:%M')"
vilnius="$(TZ=':Europe/Vilnius' date +'%H:%M')"
ankara="$(TZ=':Europe/Istanbul' date +'%H:%M')"
# bangalore="$(TZ=':Asia/Kolkata' date +'%H:%M')"
# malaysia="$(TZ=':Asia/Kuala_Lumpur' date +'%H:%M')"

echo ":globe: $toronto"
echo "---"
echo "$day"
echo "$vancouver San Francisco (-8)"
echo "$calgary Calgary (-7)"
# echo "$chicago Chicago (-6)"
echo "$toronto Toronto (-5)"
# echo "$newfoundland Newfoundland (-3.5)"
echo "$london London (0)"
# echo "$berlin Berlin (+1)"
# echo "$warsaw Warsaw (+1)"
echo "$vilnius Vilnius (+2)"
echo "$ankara Ankara (+3)"
# echo "$bangalore Bangalore"
# echo "$malaysia Malaysia (+8)"
