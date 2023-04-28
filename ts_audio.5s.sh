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
all_inputs=$($switch -t input -a)
all_outputs=$($switch -t output -a)
# input_volume=$(osascript -e 'input volume of (get volume settings)')

yeti_available=""
[[ $all_inputs == *"Yeti"* ]] && yeti_available="yes"

airpods_available=""
[[ $all_outputs == *"TS AirPods Pro"* ]] && airpods_available="yes"

# Output - make sure it's not Yeti
if [[ "$current_output" == "Yeti Nano" ]]; then

  # Prefer AirPods
  if [[ -n "$airpods_available" ]]; then
    $switch -t output -s "TS AirPods Pro"
  else
    # Switch to the next one
    $switch -t output -n
  fi
fi

# Mic - use Yeti or MacBook's
if [[ "$current_input" != "Yeti Nano" ]]; then

  # Use Yeti if available
  if [[ -n "$yeti_available" ]]; then
    $switch -t input -s "Yeti Nano"

  elif [[ "$current_input" != "MacBook Pro Microphone" ]]; then
    # Fallback to MacBook's
    $switch -t input -s "MacBook Pro Microphone"
  fi
fi

icon=":mic.fill:"

# Show a warning if AirPods mic is used
if [[ "$current_input" == "TS AirPods Pro" ]]; then
  icon="⚠️ :mic.fill:"
fi

echo "$icon"
echo "---"
echo ":mic: $current_input"
echo ":speaker.wave.2: $current_output"
