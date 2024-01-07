1. ## **w3m**
    W3m is a free, open-source, text-based web browser and terminal pager. It helps in previewing content while using ranger.
    ```sh
    sudo apt update &&
    sudo apt install w3m -y
    ```

1. ## **ranger**
    Ranger is a command line based file manager that allows to navigate directories, preview file content, open a file with an editor, and other features. Ranger provides a way to navigate the filesystem using keyboard or mouse through the command line.
    ```sh
    sudo apt update &&
    sudo apt install ranger -y &&
    ```

1. Make a symlink of the files to `.config` under `ranger` directory
    ```sh
    rm -r ~/.config/ranger &&
    ln -sf ~/packages/config/ubuntu/ranger/ranger ~/.config/ranger
    ```
