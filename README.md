# NASPi Sway DE

Sway desktop environment dotfiles for NASPi, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Packages

| Package | Contents |
|---|---|
| `sway` | Sway WM config |
| `waybar` | Dual-bar config and stylesheets |
| `nwg` | nwg-bar (power menu) + nwg-menu (app menu) |
| `wofi` | App launcher config and styles |
| `gtk` | GTK3 theme and icon settings |
| `scripts` | `~/.local/bin/` helper scripts (menus, launcher) |
| `icons` | NASPi custom icon theme |
| `system/` | System scripts — **not stow-managed, manual install** |

## Restore on a new machine

```bash
git clone https://github.com/xan942/NASPi-Sway-DE "Sway DE"
cd "Sway DE"
stow --target=$HOME sway waybar nwg wofi gtk scripts icons
```

## System scripts (manual install)

Files in `system/usr/local/bin/` are used by waybar modules and must be installed manually:

```bash
sudo cp system/usr/local/bin/i3net  /usr/local/bin/
sudo cp system/usr/local/bin/i3disk /usr/local/bin/
```
