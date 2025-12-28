## IntelliJ

1.  Download with this [link](https://www.jetbrains.com/idea/download/download-thanks.html?platform=linux) or from the [official website](https://www.jetbrains.com/idea/)

1.  Extract the `tar.gz` file into a folder

1.  Move the file over to a desired loation and rename it for easy access from terminal defined in system path

    ```sh
    mv ~/Downloads/ideaIC-2024.1.1/i* /usr/local/bin/IntelliJ
    ```

1.  Create a desktop exec by creating a file named `intellij.desktop` and pasting the following code

    ```sh
    nvim ~/.local/share/applications/intellij.desktop
    ```

    ```ini
    [Desktop Entry]
    Name=IntelliJ IDEA
    Comment=IntelliJ IDEA
    Exec=/usr/local/bin/IntelliJ/bin/idea.sh
    Icon=/usr/local/bin/IntelliJ/bin/idea.svg
    Type=Application
    Terminal=false
    StartupNotify=true
    ```

1.  Make the desktop entry executable and update cache for icon update
    ```sh
    chmod +x ~/.local/share/applications/intellij.desktop &&
    sudo update-icon-caches /usr/share/icons/*
    ```
