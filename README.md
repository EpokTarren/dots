# Install

Requires WSL(on Windows), curl, and tar.

## Linux

```sh
git clone https://github.com/EpokTarren/dots
cd dots

# Downloads built themes from https://github.com/EpokTarren/themes/releases
# Brings up a cli theme picker and sets themes to match
./setup.sh

# Create .giconfig symlink
ln -s "$PWD/.gitconfig" ~/.gitconfig

# Create neovim symlink
ln -s "$PWD/nvim" ~/.config/nvim

# Create alacritty symlink
ln -s "$PWD/alacritty" ~/.config/alacritty
```

## Windows

```powershell
# Download repo
git clone https://github.com/EpokTarren/dots
cd dots

# Downloads built themes from https://github.com/EpokTarren/themes/releases
# Brings up a cli theme picker and sets themes to match
wsl ./setup.sh

# The below commands only work in cmd
cmd.exe

# Symlink .gitconfig
mklink /H %USERPROFILE%\.gitconfig .gitconfig

# Symlink neovim
mklink /J %LOCALAPPDATA%\nvim nvim

# Symlink alacritty
mklink /J %APPDATA%\alacritty alacritty

# Symlink alacritty with cmd
mkdir %APPDATA%\alacritty
mklink /H %APPDATA%\alacritty\alacritty.toml alacritty\cmd.toml
mklink /H %APPDATA%\alacritty\base.toml alacritty\alacritty.toml
mklink /H %APPDATA%\alacritty\theme.toml alacritty\theme.toml

# Keyboard layouts
mklink /J %USERPROFILE%\qmk_firmware\keyboards\ferris\keymaps\tarren keymaps\34
mklink /J %USERPROFILE%\qmk_firmware\keyboards\tokyokeyboard\tokyo60\keymaps\tarren keymaps\hhkb
```
