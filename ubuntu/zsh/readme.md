## Install Zsh

- Install zsh
  ```sh
  sudo apt install zsh -y
  ```
- Verify installation by running `zsh --version`. Expected result: zsh 5.0.8 or more recent.
- Make it your default shell: `chsh -s $(which zsh)`
- Restart your computer to start using the new shell.
- Test with `$SHELL --version`. Expected result: 'zsh 5.8' or similar

## oh-my-zsh 
Follow the detailed instruction

The Use of powerlevel10k or other themes with oh-my-zsh gives more control over themes from terminal itself.

## oh-my-posh

- Follow oh-my-posh guide from [official website](https://ohmyposh.dev/docs/installation/linux)
- Go to [nerd fonts](https://ohmyposh.dev/docs/installation/fonts) and download `SpaceMono NF` and `Firacode NF` and install it on the system.
- Configure your shell to use [oh-my-posh](https://ohmyposh.dev/docs/installation/prompt) and use a configure to set your theme in .zshrc with `--config ~/.poshthemes/blue-own.omp.json`. My other fav themes are
  - night-owl
  - powerlevel10k_modern
  - tokyonight_storm
