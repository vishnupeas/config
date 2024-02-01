## Blender

1.  Download the latest version from the [official website](https://www.blender.org/download/)

1.  Extract the `tar.gz` file into a folder

1.  Move the file over to a desired loation and rename it for easy access from terminal defined in system path

    ```sh
    mv ~/Downloads/blender-4.0.2-linux-x64 /usr/local/bin/blender
    ```

1.  Create a desktop exec by creating a file named `blender.desktop` and pasting the following code

    ```sh
    nvim ~/.local/share/applications/blender.desktop
    ```

    ```ini
    [Desktop Entry]
    Name=Blender
    Exec=/usr/local/bin/blender/blender
    Icon=/usr/local/bin/blender/blender.svg
    Type=Application
    Categories=Graphics;3DGraphics;
    ```

1.  Make the desktop entry executable and update cache for icon update
    ```sh
    chmod +x ~/.local/share/applications/blender.desktop &&
    sudo update-icon-caches /usr/share/icons/*
    ```
