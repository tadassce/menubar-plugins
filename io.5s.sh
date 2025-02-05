#!/usr/bin/env bash

# <bitbar.title>IO</bitbar.title>
# <bitbar.version>v1.0.0</bitbar.version>
# <bitbar.author>Tadas Sce</bitbar.author>
# <bitbar.author.github>tadassce</bitbar.author.github>
# <bitbar.desc>Show audio input and output state</bitbar.desc>
# <bitbar.dependencies>switchaudio-osx</bitbar.dependencies>
# <swiftbar.hideAbout>true</swiftbar.hideAbout>
# <swiftbar.hideRunInTerminal>true</swiftbar.hideRunInTerminal>
# <swiftbar.hideLastUpdated>true</swiftbar.hideLastUpdated>
# <swiftbar.hideDisablePlugin>true</swiftbar.hideDisablePlugin>
# <swiftbar.hideSwiftBar>true</swiftbar.hideSwiftBar>

title="🎧"
switch="/opt/homebrew/bin/SwitchAudioSource"
current_input=$($switch -t input -c)
current_output=$($switch -t output -c)
# input_volume=$(osascript -e 'input volume of (get volume settings)')

# # Output - make sure it's not Yeti
# if [[ "$current_output" == "Yeti Nano" ]]; then
#   msg=""

#   # Switch to the next one
#   msg=$($switch -t output -n)

#   msg=${msg//\"/}
#   msg=${msg/output audio device set to/→ Output:}
#   msg="Mic: $current_input\\n$msg"

#   osascript -e "display notification \"$msg\" with title \"$title\""
# fi

# Output - prefer AirPods
if [[ "$current_output" != *"AirPods Pro"* ]]; then
  all_outputs=$($switch -t output -a)
  airpods_name=$(echo "$all_outputs" | grep "AirPods Pro")

  if [[ -n "$airpods_name" ]]; then
    msg=$($switch -t output -s "$airpods_name")

    msg=${msg//\"/}
    msg=${msg/output audio device set to/→ Output:}
    msg="Mic: $current_input\\n$msg"

    osascript -e "display notification \"$msg\" with title \"$title\""
  fi
fi

# Mic - use Yeti or MacBook's
if [[ "$current_input" != "Yeti Nano" ]]; then
  msg=""

  all_inputs=$($switch -t input -a)
  yeti_available=""
  [[ $all_inputs == *"Yeti"* ]] && yeti_available="yes"
  macbook_available=""
  [[ $all_inputs == *"MacBook Pro Microphone"* ]] && macbook_available="yes"

  # Use Yeti if available
  if [[ -n "$yeti_available" ]]; then
    msg=$($switch -t input -s "Yeti Nano")

  elif [[ "$current_input" != "MacBook Pro Microphone" && -n "$macbook_available" ]]; then
    # Fallback to MacBook's
    msg=$($switch -t input -s "MacBook Pro Microphone")
  fi

  msg=${msg//\"/}
  msg=${msg/input audio device set to/→ Mic:}
  [ -n "$msg" ] && msg="$msg\\nOutut: $current_output"

  [ -n "$msg" ] && osascript -e "display notification \"$msg\" with title \"$title\""
fi

echo ":mic.fill:"
echo "---"
echo ":mic: $current_input"
echo ":speaker.wave.2: $current_output"
