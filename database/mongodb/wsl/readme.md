<!--- From : https://docs.microsoft.com/en-us/windows/wsl/tutorials/wsl-database --->

## To install MongoDB (version 5.0) on WSL (Ubuntu 20.04): 
- Open your WSL terminal (ie. Ubuntu) and go to your home directory: `cd ~`
- Update your Ubuntu packages: `sudo apt update`
- Import the public key used by the MongoDB package management system: `wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -`
- Create a list file for MongoDB: `echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list`
- Reload local package database: `sudo apt-get update`
- Install MongoDB packages: `sudo apt-get install -y mongodb-org`
- Confirm installation and get the version number: `mongod --version`
- Make a directory to store data: `mkdir -p ~/data/db`
- Run a Mongo instance: `sudo mongod --dbpath ~/data/db`
- Check to see that your MongoDB instance is running with: `ps -e | grep 'mongod'`
- To exit the MongoDB Shell, use the shortcut keys: Ctrl + C