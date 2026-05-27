#!/bin/bash

# <bitbar.title>Timezones+</bitbar.title>
# <bitbar.version>v2</bitbar.version>
# <bitbar.author>Tadas Scerbinskas</bitbar.author>
# <bitbar.author.github>tadassce</bitbar.author.github>
# <bitbar.desc>Shows current time across common timezones </bitbar.desc>
# <swiftbar.hideAbout>true</swiftbar.hideAbout>
# <swiftbar.hideRunInTerminal>true</swiftbar.hideRunInTerminal>
# <swiftbar.hideLastUpdated>true</swiftbar.hideLastUpdated>
# <swiftbar.hideDisablePlugin>true</swiftbar.hideDisablePlugin>
# <swiftbar.hideSwiftBar>true</swiftbar.hideSwiftBar>

day="$(date +'%a %b %d, %Y')"
utc="$(TZ=':UTC' date +'%H:%M')"
london="$(TZ=':Europe/London' date +'%H:%M')"

offset_string_to_minutes() {
  local offset="$1"
  local sign hours minutes total

  sign="${offset:0:1}"
  hours="${offset:1:2}"
  minutes="${offset:3:2}"
  total=$((10#$hours * 60 + 10#$minutes))

  if [[ "$sign" == "-" ]]; then
    total=$((-total))
  fi

  echo "$total"
}

timezone_offset_minutes() {
  local timezone="$1"

  offset_string_to_minutes "$(TZ=":$timezone" date +'%z')"
}

current_offset_minutes="$(offset_string_to_minutes "$(date +'%z')")"

format_offset_from_current_timezone() {
  local timezone="$1"
  local timezone_offset relative_offset abs_offset hours minutes sign

  timezone_offset="$(timezone_offset_minutes "$timezone")"
  relative_offset=$((timezone_offset - current_offset_minutes))

  if [[ $relative_offset -eq 0 ]]; then
    echo "0"
    return
  fi

  sign="+"
  abs_offset="$relative_offset"
  if [[ $relative_offset -lt 0 ]]; then
    sign="-"
    abs_offset=$((-relative_offset))
  fi

  hours=$((abs_offset / 60))
  minutes=$((abs_offset % 60))

  if [[ $minutes -eq 0 ]]; then
    echo "${sign}${hours}"
  elif [[ $minutes -eq 30 ]]; then
    echo "${sign}${hours}.5"
  else
    printf "%s%d:%02d\n" "$sign" "$hours" "$minutes"
  fi
}

utc_offset_from_current="$(format_offset_from_current_timezone "UTC")"
sanfrancisco_offset_from_current="$(format_offset_from_current_timezone "America/Los_Angeles")"
toronto_offset_from_current="$(format_offset_from_current_timezone "America/Toronto")"
london_offset_from_current="$(format_offset_from_current_timezone "Europe/London")"
berlin_offset_from_current="$(format_offset_from_current_timezone "Europe/Berlin")"
vilnius_offset_from_current="$(format_offset_from_current_timezone "Europe/Vilnius")"
tokyo_offset_from_current="$(format_offset_from_current_timezone "Asia/Tokyo")"

sanfrancisco="$(TZ=':America/Los_Angeles' date +'%H:%M')"
# berlin="$(TZ=':Europe/Berlin' date +'%H:%M')"
vancouver="$(TZ=':US/Pacific' date +'%H:%M')"
chicago="$(TZ=':America/Chicago' date +'%H:%M')"
toronto="$(TZ=':America/Toronto' date +'%H:%M')"
newyork="$(TZ=':America/New_York' date +'%H:%M')"
newfoundland="$(TZ=':America/St_Johns' date +'%H:%M')"
berlin="$(TZ=':Europe/Berlin' date +'%H:%M')"
warsaw="$(TZ=':Europe/Warsaw' date +'%H:%M')"
vilnius="$(TZ=':Europe/Vilnius' date +'%H:%M')"
# bangalore="$(TZ=':Asia/Kolkata' date +'%H:%M')"
# malaysia="$(TZ=':Asia/Kuala_Lumpur' date +'%H:%M')"
tokyo="$(TZ=':Asia/Tokyo' date +'%H:%M')"

current_timezone="$(date +%Z)"

# In London?
if [[ "$current_timezone" == "GMT" ]] || [[ "$current_timezone" == "BST" ]]; then
  echo ":globe: $toronto"
else
  echo ":globe: $london"
fi

# echo ":globe: $utc UTC"

echo "---"
echo "$day"
echo "$vancouver San Francisco ($sanfrancisco_offset_from_current)"
# echo "$chicago Chicago ($(format_offset_from_current_timezone "America/Chicago"))"
echo "$toronto Toronto ($toronto_offset_from_current)"
# echo "$newfoundland Newfoundland ($(format_offset_from_current_timezone "America/St_Johns"))"
echo "$utc UTC ($utc_offset_from_current)"
echo "$london London ($london_offset_from_current)"
echo "$berlin Berlin ($berlin_offset_from_current)"
# echo "$warsaw Warsaw ($(format_offset_from_current_timezone "Europe/Warsaw"))"
echo "$vilnius Vilnius ($vilnius_offset_from_current)"
# echo "$bangalore Bangalore ($(format_offset_from_current_timezone "Asia/Kolkata"))"
# echo "$malaysia Malaysia ($(format_offset_from_current_timezone "Asia/Kuala_Lumpur"))"
echo "$tokyo Tokyo ($tokyo_offset_from_current)"
