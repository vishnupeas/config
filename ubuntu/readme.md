1. ## **build-essentials**
    ```sh 
    sudo apt install build-essential
    ```

1. ## **git**
    #### Install & Configure
    ```sh
    sudo apt install git &&
    git config --global user.name "woomiz" &&
    git config --global user.email "vishnups.developer@gmail.com"
    ```
    #### Setup SSH
    ```sh
    cd ~/.ssh &&
    ssh-keygen -t ed25519
    ```

1. ## **curl**
    ```sh
    sudo apt install curl
    ```

1. ## **FUSE**
	Read more in [here](https://github.com/AppImage/AppImageKit/wiki/FUSE)
	
	For Ubuntu (>= 22.04):

    ```sh
    sudo add-apt-repository universe
    sudo apt install libfuse2
    ```

1. ## **ripgrep**
   ```sh
   curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
   sudo dpkg -i ripgrep_13.0.0_amd64.deb
   ```

1. ## **vim**
    Follow the directory for install instructions

1. ## **neovim**
    Follow the directory for install instructions

1. ## **zsh**
    Follow the directory for install instructions

1. ## **tmux**
    Follow the directory for install instructions

1. ## **fnm**
    ```sh
    curl -fsSL https://fnm.vercel.app/install | bash &&
    fnm use 18
    ```

1. ## **dbeaver**
    Install dbeaver debian package from the [official website](https://dbeaver.io/download)

1. ## **neofetch**
    ```sh
    sudo apt install neofetch
    ```

1. ## **local wordpress**
    - #### Install local
        Download local from their [official website](https://localwp.com/)
    - #### Access the site on dbeaver
        To access the database on third party SQL client softwares read more information on how to do it from [here](https://community.localwp.com/t/how-can-i-connect-to-mysql-using-tcp-ip-rather-than-a-socket-on-macos-linux/21220)

1. ## **docker**
    Install docker following the instructions from the [official website](https://docs.docker.com/engine/install/ubuntu/#installation-methods)

1. ## **cool-retro-term**
    ```sh
    sudo apt install cool-retro-term
    ```

    Follow the directory for more themes and instructions

1. ## **qBittorrent**
   Download the AppImage form the [official website](https://www.fosshub.com/qBittorrent.html) and have it placed under `/usr/local/bin` 

1. ## **filezilla**
    ```sh
    sudo apt install filezilla
    ```

1. ## **clockify**
    Install clockify following the instructions from the [official website](https://clockify.me/apps)
