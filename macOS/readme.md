## macOS Setup

## Packages

1. ## **git**

   #### Configure Git

   ```sh
   ln -sf ~/packages/config/macOS/dotfiles/.gitconfig ~/.gitconfig
   ```

   #### Setup SSH

   ```sh
   cd ~/.ssh &&
   ssh-keygen -t ed25519 -f github
   ```

1. ## **wezterm**

   ```sh
   brew install --cask wezterm
   ```

1. ## **zsh**

   Follow the directory for install instructions.

1. ## **fnm**

   ```sh
   brew install fnm &&
   fnm use 22
   ```

1. ## **wakatime**

   ```sh
   ln -sf ~/packages/config/macOS/dotfiles/.wakatime.cfg ~/.wakatime.cfg
   ```

   Go to wakatime [webiste](https://wakatime.com/) -> settings and get the `secret api key` and replace that inside the file. Current key is old.

   ```sh
   vim ~/packages/config/macOS/dotfiles/.wakatime.cfg
   ```
