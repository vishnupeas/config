## Tmux
1. Install tmux using
    ```sh
    sudo apt install tmux
    ``` 
1. Update the config file of tmux in `~/.source/tmux/tmux.conf` with the new one 
1. Source the new tmux file
   - Use this if you are inside of tmux
    ```sh
       tmux source-file ~/.source/tmux/tmux.conf
    ```
   - Use this if you are outside of tmux
    ```sh
       source ~/.source/tmux/tmux.conf
    ```
1. Git clone and add my repo to directory and create a symbolic link
    ```sh
    git clone git@github.com:woomiz/config.git ~/packages/config
    ln -sf ~/packages/config/ubuntu/tmux/tmux.conf ~/.config/tmux/tmux.conf
    ```
