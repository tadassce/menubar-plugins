#!/usr/bin/env bash

# <bitbar.title>TS Audio</bitbar.title>
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

switch="/opt/homebrew/bin/SwitchAudioSource"
current_input=$($switch -t input -c)
current_output=$($switch -t output -c)
# input_volume=$(osascript -e 'input volume of (get volume settings)')

# Output - make sure it's not Yeti
if [[ "$current_output" == "Yeti Nano" ]]; then
  msg=""

  airpods_available=""
  all_outputs=$($switch -t output -a)
  [[ $all_outputs == *"TS AirPods Pro"* ]] && airpods_available="yes"

  # Prefer AirPods
  if [[ -n "$airpods_available" ]]; then
    msg=$($switch -t output -s "TS AirPods Pro")

  else
    # Switch to the next one
    msg=$($switch -t output -n)
  fi

  msg=${msg//\"/}
  msg=${msg/output audio device set to/→ Output:}
  msg="Mic: $current_input\\n$msg"

  [ -n "$msg" ] && osascript -e "display notification \"$msg\" with title \"TS Audio\""
fi

# Mic - use Yeti or MacBook's
if [[ "$current_input" != "Yeti Nano" ]]; then
  msg=""

  yeti_available=""
  all_inputs=$($switch -t input -a)
  [[ $all_inputs == *"Yeti"* ]] && yeti_available="yes"

  # Use Yeti if available
  if [[ -n "$yeti_available" ]]; then
    msg=$($switch -t input -s "Yeti Nano")

  elif [[ "$current_input" != "MacBook Pro Microphone" ]]; then
    # Fallback to MacBook's
    msg=$($switch -t input -s "MacBook Pro Microphone")
  fi

  msg=${msg//\"/}
  msg=${msg/input audio device set to/→ Mic:}
  msg="$msg\\nOutut: $current_output"

  [ -n "$msg" ] && osascript -e "display notification \"$msg\" with title \"TS Audio\""
fi

echo ":mic.fill:"
echo "---"
echo ":mic: $current_input"
echo ":speaker.wave.2: $current_output"
