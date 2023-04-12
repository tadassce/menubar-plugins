#!/usr/bin/env bash

# <bitbar.title>TS Audio</bitbar.title>
# <bitbar.version>v1.0.0</bitbar.version>
# <bitbar.author>Tadas Sce</bitbar.author>
# <bitbar.author.github>tadassce</bitbar.author.github>
# <bitbar.desc>Show audio input and output state</bitbar.desc>
# <bitbar.dependencies>switchaudio-osx</bitbar.dependencies>

brew_bin="/opt/homebrew/bin"
input_full=$($brew_bin/SwitchAudioSource -c -t input)
output_full=$($brew_bin/SwitchAudioSource -c -t output)
input=":mic: ${input_full::3}"
output=":speaker.wave.2: ${output_full::3}"
input_volume=$(osascript -e 'input volume of (get volume settings)')

if [[ "$input" =~ Mac$ ]]; then
  input=":mic: :laptopcomputer:"
elif [[ "$input" =~ TS\ $ ]]; then
  input=":airpodpro.left:"
elif [[ "$input" =~ Yet$ ]]; then
  input=":mic.fill:"
fi

if [[ "$input_volume" == "0" ]]; then
  input=":mic.slash:"
fi

# Make sure the output is not Yeti
if [[ "$output" =~ Yet$ ]]; then
  # Switch to the next one
  $($brew_bin/SwitchAudioSource -t output -n)
fi

# Use Yeti mic if available
if [[ ! "$input" =~ Yet$ ]]; then
  $($brew_bin/SwitchAudioSource -t input -s "Yeti Nano")
fi

if [[ "$output" =~ LG\ $ ]]; then
  output=":speaker.wave.2: :display:"
elif [[ "$output" =~ TS\ $ ]]; then
  output=":airpodpro.right:"
elif [[ "$output" =~ Ext$ ]]; then
  output=":headphones:"
fi

# result="$input $output "
# result="$input $input_volume $output "

# if [[ "$input" == ":airpodpro.left:" && "$output" == ":airpodpro.right:" ]]; then
#   result=":airpodspro:"
# fi

# Show a warning if AirPods mic is used
# result=" "
# result=":mic.circle:"
# result=":mic.circle.fill:"
# result=":mic:"
result=":mic.fill:"

if [[ "$input" == ":airpodpro.left:" ]]; then
  # result=":exclamationmark.triangle.fill: :mic.fill: :airpodspro:"
  # result="⚠️ :mic.fill: :airpodspro:"
  result="⚠️ :mic.fill:"
fi

echo "$result"
echo "---"
echo "Mic: $input_full - $input_volume"
echo "Out: $output_full"
