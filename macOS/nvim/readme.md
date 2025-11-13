## Install

1. Install neovim using homebrew
   ```sh
   brew install neovim
   ```
1. Bonus #2: Also in your `bashrc/zshrc` etc set your EDITOR env var so various programs know what editor you prefer to use: `EDITOR=/usr/local/bin/nvim`
1. Install `ripgrep` for telescope fuzzy finder, find more on this from [github](https://github.com/BurntSushi/ripgrep)
   ```sh
   brew install ripgrep
   ```
1. Git clone my repo and create a symbolic link to the directory
   ```sh
   ln -sf ~/packages/config/macOS/nvim/nvim ~/.config/nvim
   ```
