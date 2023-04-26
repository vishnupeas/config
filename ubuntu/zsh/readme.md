## Install Zsh

- install

```sh
sudo apt install zsh
```

- Verify installation by running `zsh --version`. Expected result: zsh 5.0.8 or more recent.
- Make it your default shell: `chsh -s $(which zsh)`
- Log out and log back in again to use your new default shell.
- Test with `$SHELL --version`. Expected result: 'zsh 5.8' or similar

## Install zsh-syntax-highlighting

- install

```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

- Activate the plugin in ~/.zshrc:
   `plugins=( [plugins...] zsh-syntax-highlighting)`

## Install zsh-autosuggestions

- install

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

- Activate the plugin in ~/.zshrc:
   `plugins=( [other plugins...] zsh-autosuggestions)`

## Install zsh-autocomplete

- install

```sh
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
```

- Add it to FPATH in your .zshrc by adding the following line before

```sh
 source "$ZSH/oh-my-zsh.sh"`:
`fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
```

> You could also Use powerlevel10k or other themes with oh-my-zsh [ has more control over themes from terminal itself]

## Install oh-my-posh

- Follow oh-my-posh guide from [official website](https://ohmyposh.dev/docs/installation/linux)
- Go to [nerd fonts](https://ohmyposh.dev/docs/installation/fonts) and download `SpaceMono NF` and `Firacode NF` and install it on the system.

- Configure your shell to use [oh-my-posh](https://ohmyposh.dev/docs/installation/prompt) and use a configure to set your theme in .zshrc with `--config ~/.poshthemes/blue-own.omp.json`. My other fav themes are
  - night-owl
  - powerlevel10k_modern
  - tokyonight_storm
