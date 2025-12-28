## NOTES FOR MY TMUX CONFIG

### some of the commands involved in using tmux

- Use `tmux new -s vim` to start a new session in tmux
- Use `tmux kill-server` to kill all the tmux servers
- Use `tmux kill-session -t vim` to kill a perticular tmux session
- Use `tmux attach -t vim` to attach to a certain session
- Use `tmux ls` to list all the sessions
- Use `tmux rename-session -t vim` to rename a certain session
- Use `tmux source-file ~/.config/tmux.conf` to apply changes to existing tmux window

### General

- Use `ctrl + a + s` to open up navigation menu
- Use `ctrl + a + I` for install and update the tmux configuration

### Sessions

- Use `ctrl + a + d` to detach the tmux session
- Use `ctrl + a + (` to move to previous session
- Use `ctrl + a + )` to move to next session
- Use `ctrl + a + $` to rename the current tmux session

### Pane

- Use `ctrl + a + q` to display the pane numbers
- Use `ctrl + a + x` to kill/close the pane
- Use `ctrl + a + s` to split the pane horizontally
- Use `ctrl + a + v` to split the pane vertically
- Use `ctrl + a + q` to list all the pane
- Use `ctrl + a + !` to convert the pane as a new window

### Window

- Use `ctrl + a + c` to opens a new window
- Use `ctrl + a + ,` to rename current window
- Use `ctrl + a + n` to move to next window
- Use `ctrl + a + p` to move to previous window
- Use `ctrl + a + 1` to move to window numbered 1
