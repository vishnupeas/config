# Learning VIM

## Date: 14/12/2023
- Use `vim` to open vim, make changes, then use `:wq file.txt` to write to the file and quit the file. Alternatively use `vim file.txt` to create a file in edit mode and save it with `:w`.
- `:e[dit]` accepts wildcard arguments. `*` matches any files in the current directory. If you are only looking for files with `.yml` extension in the current directory:
```
:edit *.yml<Tab>
```

## Date: 1/1/2024
- To split the pane horizontally use `Ctrl + w + s` or `:sp` or `:split`, eg: `sp file1.txt`
- To split the pane verticallly use `Ctrl + w + v` or `:vsp` or `vsplit`, eg: `vsp file1.txt`
- To make the panes all of equal width use `Ctrl + w + =`
