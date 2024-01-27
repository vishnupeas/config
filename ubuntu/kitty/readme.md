## Install the latest version of kitty with the binary

```sh
# Install and update kitty using
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin &&

# Create a system wide path
mkdir ~/.local/bin &&
sudo sed -i "s,\"$,:$HOME/.local/bin\","  /etc/environment &&

# Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in
# your system-wide PATH)
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/ &&

# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/ &&

# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/ &&

# Update the paths to the kitty and its icon in the kitty.desktop file(s)
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop &&
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop &&

# Update the default terminal emulator to kitty
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator `which kitty` 50 &&
sudo update-alternatives --config x-terminal-emulator
```

## Replace with updated config files

```sh
ln -sf ~/packages/config/ubuntu/kitty/current-theme.conf ~/.config/kitty/current-theme.conf &&
ln -sf ~/packages/config/ubuntu/kitty/kitty.conf ~/.config/kitty/kitty.conf
```
