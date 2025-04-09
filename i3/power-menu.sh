#!/bin/bash
chosen=$(echo -e "🔒 Lock\n⏻ Shutdown\n🔄 Reboot\n📴 Logout" | rofi -dmenu -p "Power Menu")

case "$chosen" in
"🔒 Lock") i3lock -c 000000 ;;
"⏻ Shutdown") systemctl poweroff ;;
"🔄 Reboot") systemctl reboot ;;
"📴 Logout") i3-msg exit ;;
esac
