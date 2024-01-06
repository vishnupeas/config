## Tmux
1. Install tmux using
    ```sh
    sudo apt install tmux -y
    ``` 
1. Git clone and add my repo to directory and create a symbolic link to my `tmux.conf` file
    ```sh
    git clone git@github.com:woomiz/config.git ~/packages/config &&
    mkdir ~/.config/tmux/ &&
    ln -sf ~/packages/config/ubuntu/tmux/tmux.conf ~/.config/tmux/tmux.conf
    ```
1. Source the new tmux file
   - Use this if you are inside of tmux
    ```sh
       tmux source-file ~/.source/tmux/tmux.conf
    ```
   - Use this if you are outside of tmux
    ```sh
       source ~/.source/tmux/tmux.conf
    ```
