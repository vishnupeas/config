## Postman

1.  Download the latest version from the [official website](https://www.postman.com/downloads/)

    ```sh
    curl -Lo Postman.tar.gz "https://dl.pstmn.io/download/latest/linux_64"
    ```

1.  Extract the `tar.gz` file content into `~/.local/share`

    ```sh
    tar -xvzf Postman.tar.gz -C ~/.local/share/
    ```

1.  Remove `tar.gz` file

    ```sh
    rm -rf Postman.tar.gz
    ```

1.  Make an executable file in PATH `/usr/local/bin` with symlink to one inside

    ```sh
    sudo ln -sf ~/.local/share/Postman/Postman /usr/bin/postman
    ```

1.  Create a desktop exec by creating a file named `postman.desktop` and pasting the following code

    ```sh
    nvim ~/.local/share/applications/postman.desktop
    ```

    ```ini
    [Desktop Entry]
    Type=Application
    Name=Postman
    Icon=/home/elmiur/.local/share/Postman/app/resources/app/assets/icon.png
    Exec=/home/elmiur/.local/share/Postman/Postman
    Comment=Postman Desktop App
    Categories=Development
    ```

1.  Update cache for icon update
    ```sh
    sudo update-icon-caches /usr/share/icons/*
    ```
