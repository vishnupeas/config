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

> Use powerlevel10k other themes with oh-my-zsh [ has more control over themes from terminal itself]

## Install oh-my-zsh

- install

```sh
 sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
 ```

## Adding powerlevel10k theme

- download nerd fonts and install them individually from the offcial github
- add powerlevel10k theme,

```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

- Set `ZSH_THEME="powerlevel10k/powerlevel10k"` in ~/.zshrc
- restart the terminal
- cofigure again using `p10k configure`
