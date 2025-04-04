## Install

1. Download `nvim.appimage` from [github](https://github.com/neovim/neovim/releases)
1. Run `chmod u+x nvim.appimage && ./nvim.appimage`
   - If your system does not have FUSE you can extract the appimage:
     ```
     ./nvim.appimage --appimage-extract
     ./squashfs-root/usr/bin/nvim
     ```
1. Move it to a folder that's indexed in your PATH env var so your computer knows what you mean when you type nvim. You can check the folders in your current path by typing echo `$PATH` which will show you something like this: `/usr/local/bin:/usr/bin`. Notice there are 2 folders here in this case separated by a colon (:). You will likely have more than two. `/usr/local/bin` is a common place to stick it. To move it there you'll need to use
   ```sh
   sudo mv nvim.appimage /usr/local/bin/nvim
   ```
1. When you type nvim it should "just work™"
1. Bonus: add this to `~/.bashrc` `/~/.zshrc` etc to create an alias in case you accidentally type vi (I always type it by mistake): `alias vi=nvim`
1. Bonus #2: Also in your `bashrc/zshrc` etc set your EDITOR env var so various programs know what editor you prefer to use: `EDITOR=/usr/local/bin/nvim`
1. Install `ripgrep` for telescope fuzzy finder, find more on this from [github](https://github.com/BurntSushi/ripgrep)
   ```sh
   sudo apt install ripgrep
   ```
1. Git clone my repo and create a symbolic link to the directory
   ```sh
   git clone git@github.com:vishnupeas/config.git ~/packages/config &&
   ln -sf ~/packages/config/ubuntu/nvim/nvim ~/.config/nvim
   ```

## Additional Setup

1. Add custom c,c++ formatting for clangd for the user
   ```sh
   ln -sf ~/packages/config/ubuntu/dotfiles/.clang-format ~/
   ```
1. Adding support for editing latex on nvim using `vimtex`. Read more on [official website](https://www.ejmastnak.com/tutorials/vim-latex/luasnip/)

   - Install `tex-live`

   ```sh
   sudo apt-get update -y &&
   sudo apt-get update texlive-latex-extra -y
   ```

   -- Install `latexmk`

   ```sh
   sudo apt-get install latexmk -y
   ```

   -- Install `pip/pip3` along with python3

   ```sh
   sudo apt install python3-pip -y
   ```

   -- Install `okular` as the pdf viewer

   ```sh
   sudo apt install okular -y
   ```
