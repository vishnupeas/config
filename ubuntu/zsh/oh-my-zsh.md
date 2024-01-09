## Install oh-my-zsh

Install oh-my-zsh by cloning the repo, if connection goes out use a differnt network, its caused by GFW china
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Install zsh-syntax-highlighting

- Install
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

- Activate the plugin in ~/.zshrc:
   `plugins=( [plugins...] zsh-syntax-highlighting)`

## Install zsh-autosuggestions

- Install

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

- Activate the plugin in ~/.zshrc:
   `plugins=( [other plugins...] zsh-autosuggestions)`

## Install zsh-autocomplete

- Install

   ```sh
   git clone --depth 1 https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
   ```
- Add it to `FPATH` in your `.zshrc` by adding the following line before `source "$ZSH/oh-my-zsh.sh"`:

      fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

## Adding powerlevel10k theme

### Initializing powderlevel10k
- Download nerd fonts and install them individually from the [official github](https://github.com/romkatv/powerlevel10k#manual-font-installation) , if that doesn't work **then only** try downloading the font from [nerd font site](https://www.nerdfonts.com/font-downloads). You can work with any nerd fonts but `MesloLGS NF` nerd font is patched to work better with powerlevel10k which is avialable in the official github page.
- Use `font-manager` application to add the fonts.
- Visual Studio Code: Open File → Preferences → Settings (PC) or Code → Preferences → Settings (Mac), enter `terminal.integrated.fontFamily` in the search box at the top of Settings tab and set the value below to `MesloLGS NF`.
- GNOME Terminal (the default Ubuntu terminal): Open Terminal → Preferences and click on the selected profile under Profiles. Check Custom font under Text Appearance and select `MesloLGS NF Regular`.
- Add powerlevel10k theme,
    ```sh
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    ```
- Set `ZSH_THEME="powerlevel10k/powerlevel10k"` in `.zshrc`
- Restart the terminal
- Configure it again using `p10k configure` or edit `.p10k.zsh`

### Changing colors of the promt
You can change the colors on terminal and change the orders of it in .p10k.zsh
Read more on this on the [official github](https://github.com/romkatv/powerlevel10k#how-do-i-change-prompt-colors)

You can check the colors that your terminal supports by entering
```sh
for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
```

### Update the .p10k.zsh with my config
You can change the colors but to use already configured settings from my repo create a symlink to the file
```sh
git clone git@github.com:woomiz/config.git ~/packages/config
ln -sf ~/packages/config/ubuntu/zsh/.p10.zsh ~/.p10.zsh
```

### Update the zshrc with my config from git
Git clone my repo and create a symbolic link to the directory
```sh
git clone git@github.com:woomiz/config.git ~/packages/config
ln -sf ~/packages/config/ubuntu/zsh/.zshrc ~/.zshrc
```
