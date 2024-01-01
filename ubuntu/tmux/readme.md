## Tmux
1. Install tmux using
```sh
   sudo apt install tmux
``` 
2. update the config file of tmux in `~/.source/tmux/tmux.conf` with the new one 
3. Source the new tmux file
   - Use this if you are inside of tmux
	```sh
	   tmux source-file ~/.source/tmux/tmux.conf
	```
   - Use this if you are outside of tmux
	```sh
	   source ~/.source/tmux/tmux.conf
	```
