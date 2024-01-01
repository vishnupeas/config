- some of the commands involved in using tmux
Use `tmux new -s vim` to start a new session in tmux
Use `tmux kill-server` to kill all the tmux servers
Use `tmux kill-session -t vim` to kill a perticular tmux session
Use `tmux attach -t vim` to attach to a certain session
Use `tmux ls` to list all the sessions
Use `tmux rename-session -t vim` to rename a certain session 
Use `tmux source-file ~/.config/tmux.conf` to apply changes to existing tmux window

### General
Use `ctrl + b + s` to open up navigation menu

### Sessions
Use `ctrl + b + d` to detach the tmux session
Use `ctrl + b + (` to move to previous session 
Use `ctrl + b + )` to move to next session 
Use `ctrl + b + $` to rename the current tmux session
#### Pane
Use `ctrl + b + q` to display the pane numbers 
Use `ctrl + b + x` to kill/close the pane
Use `ctrl + b + "` to split the pane horizontally
Use `ctrl + b + %` to split the pane vertically
Use `ctrl + b + q` to list all the pane
Use `ctrl + b + !` to convert the pane as a new window
### Window
Use `ctrl + b + c` to opens a new window
Use `ctrl + b + ,` to rename current window
Use `ctrl + b + n` to move to next window
Use `ctrl + b + p` to move to previous window
Use `ctrl + b + 1` to move to window numbered 1

