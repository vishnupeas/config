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
s
