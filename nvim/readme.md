## Install
1. Download nvim.appimage from github
1. Run `chmod u+x nvim.appimage && ./nvim.appimage`
    - If your system does not have FUSE you can extract the appimage:
        ```
        ./nvim.appimage --appimage-extract
        ./squashfs-root/usr/bin/nvim
        ```