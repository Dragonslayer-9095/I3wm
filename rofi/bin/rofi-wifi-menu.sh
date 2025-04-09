#!/bin/bash

# Nerd Font icons
wifi_icon="直"
lock_icon=""
signal_icons=("󰤯" "󰤟" "󰤢" "󰤥" "󰤨")
airplane_icon="✈️"

# Get WiFi interface
interface=$(nmcli device status | awk '$2=="wifi"{print $1; exit}')
[[ -z "$interface" ]] && notify-send "WiFi" "No WiFi interface found." && exit 1

# Check WiFi status
wifi_status=$(nmcli radio wifi)
toggle_line="$([ "$wifi_status" = "enabled" ] && echo "$airplane_icon  Disable WiFi" || echo "$airplane_icon  Enable WiFi")"

# Get active SSID
active_ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)

# List networks
networks=$(nmcli -t -f SSID,SECURITY,SIGNAL dev wifi list ifname "$interface" | awk -F':' '!seen[$1]++')

# Build menu
menu="$toggle_line\n"
while IFS=':' read -r ssid sec sig; do
  [[ -z "$ssid" ]] && ssid="<Hidden>"
  signal_level=$((sig / 20))
  [[ $signal_level -gt 4 ]] && signal_level=4
  signal_icon="${signal_icons[$signal_level]}"
  lock_status=$([[ "$sec" != "--" && "$sec" != "" ]] && echo "$lock_icon" || echo "")
  active_marker=$([[ "$ssid" == "$active_ssid" ]] && echo "✅" || echo "")
  menu+="$signal_icon $ssid $lock_status $active_marker\n"
done <<<"$networks"
chosen=$(echo -e "$menu" | rofi -dmenu -p "WiFi Networks" -theme ~/.config/rofi/wifi.rasi)

# Choose from menu
[[ -z "$chosen" ]] && exit

# Handle toggle
if [[ "$chosen" == *"Disable WiFi"* ]]; then
  nmcli radio wifi off && notify-send "WiFi" "WiFi disabled"
  exit
elif [[ "$chosen" == *"Enable WiFi"* ]]; then
  nmcli radio wifi on && notify-send "WiFi" "WiFi enabled"
  exit
fi

# Extract SSID
ssid=$(echo "$chosen" | sed -E 's/^[^ ]+ (.+?) .*/\1/')
[[ "$ssid" == "<Hidden>" ]] && notify-send "WiFi" "Hidden SSID not supported yet." && exit 1

# Get security info
security=$(nmcli -t -f SSID,SECURITY dev wifi list | grep -F "$ssid" | head -n1 | cut -d: -f2)

# Ask for password if secured
if [[ "$security" != "--" && "$security" != "" ]]; then
  password=$(rofi -dmenu -password -p "Password for $ssid")
  nmcli dev wifi connect "$ssid" password "$password" ifname "$interface"
else
  nmcli dev wifi connect "$ssid" ifname "$interface"
fi

# Notify
if [[ $? -eq 0 ]]; then
  notify-send "WiFi" "Connected to $ssid"
else
  notify-send "WiFi" "Failed to connect to $ssid"
fi
