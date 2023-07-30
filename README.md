# My Arch/Hyprland config

These are the dotfiles for my setup. I made it to be as simple and functional as possible, keeping the style beautiful and consistent across the OS.<br>
It mainly uses Catppuccin for the theming (**Mocha** for dark mode and **Latte** for light mode)
<br>
<br>
> :warning: Some titles and names are **not** in english, they are in Portuguese(my native language) and may not work correctly in your setup, I'll list some changes that need to be done so that it can work work with your language **but I'll probably forget some**, feel free to raise a issue or a pull request.

## Screenshots
| <!-- --> | <!-- --> |
| --- | --- |
| ![Dark mode 1](/Screenshots/desktop-dark_01.png) | ![Dark mode 2](/Screenshots/desktop-dark_02.png) |
|![Light mode 1](/Screenshots/desktop-light_01.png) | ![Light mode 2](/Screenshots/desktop-light_02.png) |

## Usage
- To change wallpaper: use the **set-wallpaper [PATH] [-dark]** tool defined in Zsh/.zshrc

## Installation
**Go to "~/.config/":**
- Hyprland
- waybar
- kitty
- wofi/rofi
- mako
- neovim

**Go to "~":**
- Contents of the **home** folder

**Go to "/usr/share/":**
- sddm (Change the theme in the file /etc/sddm.conf.d/10-theme.conf)

**Others:**
- Wallpapers

## Requirements
Honestly, most of those are optional and depend on personal taste.

- Hyprland
- Waybar
- rofi
- Zsh & oh-my-zsh
- Kitty
- neovim
- mako
- sddm

**Others:**
- Nerd Fonts (JetBrainsMono) - Used almost everywhere
- onefetch - Similar to neofetch but for Git repos
- swaylock - Screen locking
- btop - Resources monitor
- albert - An alternative to rofi, app launcher, calculator, etc
- thunar - File manager

## Language Changes
- **.config/mako/config**
  - Line 42: Change "Importante" to "Warning"
  - Line 47: Change "notificações a mais" to "more"
  - Line 50: Change "Importante" to "Warning" and "notificações a mais" to "more"
- **.config/hypr/scripts/do-not-disturb.sh**
  - Line 10: Change "Modo não perturbe" to "Do not disturb mode" and "Ativo" to "Activated"
  - Line 15: Change "Modo não perturbe" to "Do not disturb mode" and "Desativado" to "Deactivated"
- **.config/waybar/config.jsonc**
  - Line 108: Change "date +\"%a, %d de %B\"" to "date +\"%a, %B %d\""

## Credits
- [Sol does tech - Hyprland v2 config](https://www.youtube.com/watch?v=8GmpCwBqHCA&t=0s&ab_channel=SolDoesTech) - In the end, this setup is just a modified version of his
- [Catppuccin](https://github.com/catppuccin/catppuccin) - Basically all the colors here are from some variant of Catppuccin
- [Hyprdots](https://github.com/prasanthrangan/hyprdots/tree/main) - I stole hyperdots config for rofi and modified just a little, and also based my header bar on theirs a little bit

