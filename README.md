# 🌸 i3wm Dotfiles – Aesthetic + Functional Tiling Setup

Welcome to my personal i3wm dotfiles! This repo contains my fully themed and customized i3 window manager configuration, designed for a clean, minimal, and highly functional workflow — all wrapped in a gorgeous Catppuccin Mocha Rosewater-inspired theme.

![Screenshot](./.assets/screenshot.png)

## 📸 Additional Previews

**🌊 Dock Preview**  
![Dock](./.assets/dock.png)

**⚡ Power Menu**  
![Power Menu](./.assets/powermenu.png)

## ✨ Features

- 🚀 Lightweight and fast tiling window manager (i3-gaps)
- 🧠 Smooth and responsive keybindings for productivity
- 🎨 Beautiful Catppuccin Mocha Rosewater color scheme across all components
- 🔒 Sleek i3lock setup with blur + rounded corners
- 🎛 Custom Rofi menus: launcher, powermenu, wifi menu, askpass, confirm
- 🎵 Polybar with Spotify module, CPU/RAM, i3 workspaces, and more
- 📦 Minimal yet complete dotfiles for fast deployment
- 🖋 Fonts: `JetBrains Mono`, `Manrope`, `RecMonoCasual Nerd Font`

## 🧰 Tools Used

| Tool           | Purpose                        |
|----------------|--------------------------------|
| `i3-gaps`      | Tiling window manager          |
| `Polybar`      | Status bar                     |
| `Rofi`         | App launcher and menus         |
| `i3lock`       | Lock screen                    |
| `feh` / `nitrogen` | Wallpaper setting          |
| `picom`        | Compositor with blur & shadow  |
| `dunst`        | Notification daemon            |
| `alacritty` / `kitty` | Terminal emulator       |
| `playerctl`    | Media control for Polybar      |

## 🎨 Theming

Everything is themed using the **Catppuccin Mocha Rosewater** palette. This includes:

- Rofi menus (`launcher`, `powermenu`, `wifi.rasi`, etc.)
- Polybar modules
- i3 borders and gaps
- Lock screen
- Notifications

## 🔧 Installation

> ⚠️ This setup is tailored for **Kali Linux** with **i3wm**. Use at your own risk and back up existing configs!

```bash
git clone https://github.com/Dragonslayer-9095/I3wm.git ~/.dotfiles
cd ~/.dotfiles
./install.sh  # Or manually symlink configs as you like

