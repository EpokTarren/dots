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
ln -s ~/.gitconfig .gitconfig

# Create neovim symlink
ln -s ~/.config/nvim nvim

# Create alacritty symlink
ln -s ~/.config/alacritty alacritty
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
mklink /H %APPDATA%\alacritty\alacritty.yml alacritty\cmd.yml
mklink /H %APPDATA%\alacritty\base.yml alacritty\alacritty.yml
mklink /H %APPDATA%\alacritty\theme.yml alacritty\theme.yml
```
