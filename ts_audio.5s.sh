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

brew_bin="/opt/homebrew/bin"
current_input=$($brew_bin/SwitchAudioSource -c -t input)
current_output=$($brew_bin/SwitchAudioSource -c -t output)
# input_volume=$(osascript -e 'input volume of (get volume settings)')

# My devices
yeti="Yeti Nano"
lg="LG UltraFine Display Audio"
mac_mic="MacBook Pro Microphone"
mac_speakers="MacBook Pro Speakers"
airpods="TS AirPods Pro"

# Output - make sure it's not Yeti
if [[ "$current_output" == $yeti ]]; then
  # Switch to the next one
  $($brew_bin/SwitchAudioSource -t output -n)
fi

# Mic - use Yeti or MacBook's
if [[ "$current_input" != $yeti ]]; then
  # Default to MacBook's
  $($brew_bin/SwitchAudioSource -t input -s $mac_mic)
  # Use Yeti if available
  $($brew_bin/SwitchAudioSource -t input -s $yeti)
fi

icon=":mic.fill:"

# Show a warning if AirPods mic is used
if [[ "$current_input" == $airpods ]]; then
  icon="⚠️ :mic.fill:"
fi

echo "$icon"
echo "---"
echo "Mic: $current_input"
echo "Out: $current_output"
