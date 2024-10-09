## STEPS

### Pre-Requisite

```sh
sudo apt update && sudo sudo apt upgrade
```

### Install 3 in 1

Install `php`, `composer`, `apache2`. Run this one time and close the terminal.

```sh
/bin/bash -c "$(curl -fsSL https://php.new/install/linux)"
```

Then run the same code again. For more details check [official doc](https://laravel.com/docs/11.x/installation)

### PHP

#### Install Latest Version

```sh
sudo apt install php
sudo apt install libapache2-mod-php # install apache2 for latest php
sudo apt install php-mysql # install mysql for latest php
php -v
```

#### Optional - Install a differnt version of php

```sh
sudo apt update &&
sudo apt install -y lsb-release gnupg2 ca-certificates apt-transport-https software-properties-common # Install some packages before

sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install php8.2 -y
sudo apt install php8.2-bcmath php8.2-xml php8.2-curl php8.2-dom php8.2-mysql php8.2-gd php8.2-zip php8.2-intl # install required extensions (here I have added it for laravel)

sudo update-alternatives --config php # to change the deafult php version to current version

# install apache2 for php8.2 - do this after installing apache2
sudo apt install libapache2-mod-php8.2
sudo a2enmod php8.2 # Enable mod_php module
sudo systemctl restart apache2
```

### Composer

Read the [official doc](https://getcomposer.org/download/) for more clarity.

```sh
cd &&
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

sudo mv composer.phar /usr/local/bin/composer # to move composer.phar to a directory in $PATH
```

### Apache

1. Install `apache2`

   ```sh
   sudo apt install apache2
   ```

1. Disable `apache2` on boot

   ```sh
   sudo systemctl disable apache2
   ```

1. Check if firewall is enabled and http/https traffic is allowed for apache2. If its not enabled, enable it
   ```sh
   sudo ufw app list
   ```

### Optional - Firewall

check firewall to see if `Apache` is allowed in `80` and if you need https then allow `443`

```sh
# List all the Application Profiles
sudo ufw app list

# See the rules for the specific profile
sudo ufw app info 'Apache Full'

# Enable UFW (turn on the firewall)
sudo ufw enable

# Disable UFW (turn off the firewall)
sudo ufw disable

# Check UFW status (shows whether UFW is active and lists current rules)
sudo ufw status

# Check UFW status with more detail
sudo ufw status verbose

# Allow incoming connections on a specific port (e.g., HTTP on port 80)
sudo ufw allow 80/tcp

# Allow incoming connections for a specific service (e.g., Apache Full profile, which includes HTTP and HTTPS)
sudo ufw allow 'Apache Full'

# Deny incoming connections on a specific port (e.g., block HTTP traffic on port 80)
sudo ufw deny 80/tcp

# Delete a specific rule (e.g., remove the rule that allows HTTP on port 80)
sudo ufw delete allow 80/tcp

# Reset UFW to default settings (removes all rules and disables UFW)
sudo ufw reset

# Reload UFW to apply any changes made to configuration files
sudo ufw reload
```

### MySQL

1. Install MySQL
   ```sh
   sudo apt install mysql-server
   ```
1. Secure MySQL Installation
   ```sh
   sudo mysql_secure_installation
   ```
1. Change MySQL password
   Default authentication for mysql administrative user is `unix_socket` but it can't be used for `phpmyadmin` so create a `caching_sha2_password` for the root (optionally you can also create a new user)

   1. Access mysql

      ```sh
       sudo mysql
      ```

   1. change password

      ```sql
      USE mysql;
      SHOW VARIABLES LIKE 'validate_password%';
      SET GLOBAL validate_password.policy = 0;
      SET GLOBAL validate_password.length = 4;
      ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'some';
      FLUSH PRIVILEGES;
      ```

   1. Check if password has changed
      ```sh
      mysql -u root -p
      ```

1. Disable mysql on boot
   ```sh
   sudo systemctl disable mysql
   ```
1. Start/stop/restart mysql
   ```sh
   sudo systemctl start mysql
   sudo systemctl stop mysql
   sudo systemctl restart mysql
   ```

### phpmyadmin

#### Case 1: Smooth Installation

1. Install phpmyadmin

   ```sh
   sudo apt install phpmyadmin
   ```

1. link phpmyadmin to `apache2`

   ```sh
   sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
   ```

#### Case 2: Manually Set Up phpMyAdmin Database

We have to do this if we are stuck with the installation screen of `phpmyadmin` giving an error `Password doesn't satisfy the current policy requirements` asking you to retry.

- Setup the database, table and user

  ```sh
  sudo mysql -u root -p

  # create database and user
  CREATE DATABASE phpmyadmin;
  CREATE USER 'phpmyadmin'@'localhost' IDENTIFIED BY 'your_password_here';
  GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'phpmyadmin'@'localhost' WITH GRANT OPTION;
  FLUSH PRIVILEGES;

  # Import phpmyadmin configuration tables to the database
  sudo mysql -u root -p phpmyadmin < /usr/share/phpmyadmin/sql/create_tables.sql
  ```

- Configure phpmyadmin to use the database

  ```sh
  sudo vim /etc/phpmyadmin/config.inc.php
  ```

- Here, change the values on the file

  ```
  $cfg['Servers'][$i]['controluser'] = 'phpmyadmin';
  $cfg['Servers'][$i]['controlpass'] = 'your_password_here';
  ```

- Restart apache2

  ```sh
  sudo systemctl restart apache2
  ```

#### Update phpmyadmin upload limit

- Open the file to edit

  ```sh
  sudo vim /etc/php/8.3/apache2/php.ini
  ```

- Now change values in this file to

  ```
  memory_limit = 750M
  post_max_size = 750M
  upload_max_filesize = 1000M
  max_execution_time = 5000
  max_input_time = 3000
  ```

- Restart `apache2` after this

  ```sh
  sudo systemctl restart apache2
  ```

### Setup virtual hosts

In this step we are trying to configure `apache` to host a website that we want to serve under a certain domain. By default `apache` serves files under `/var/www/html/`. But we need it to server the files in our custom file path.

- Edit `/etc/hosts`

  ```sh
  sudo vim /etc/hosts
  ```

  Now add all the domains in here eg:

  ```
  127.0.0.1 elmiur.test
  ```

- Make a copy of default apache conf

  ```sh
  cd /etc/apache2/sites-enabled/
  sudo cp 000-default.conf mysitesomething.conf #filename is not significant
  sudo vim mysitesomething.conf
  ```

- Now replace the file with this content. Here i'm serving a laravel project, so the root files are served under `public` directory.

  ```conf
  <VirtualHost *:80>
      ServerAdmin webmaster@localhost
      ServerName elmiur.test
      DocumentRoot /home/elmiur/work/projects/mysite/public

      <Directory /home/elmiur/work/projects/mysite/public>
          Options Indexes FollowSymLinks
          AllowOverride All
          Require all granted
      </Directory>

      ErrorLog ${APACHE_LOG_DIR}/error.log
      CustomLog ${APACHE_LOG_DIR}/access.log combined

  </VirtualHost>
  ```

- Enable this configuration with

  ```sh
  sudo a2ensite mysitesomething.conf
  sudo systemctl restart apache2
  ```

- Give permission to access storage. Because the application generates files like user data(profile image, other attachments), cache, logs etc... that needs to be served by web-servers like `apache` and `nginx` we need to give access to these folders inside project for the user group `www-data`. Here we are giving ownership to current user (can do anything with the data) and group ownership to `var-www` (can read and write).

  ```sh
  sudo chown -R $USER:www-data storage
  ```

- Make sure the project path is discoverable. Check that with

  ```sh
  namei /home/elmiur/work/mysite/

  sudo chmod o+x /home/elmiur # If this is not discoverable, give persmission to the path with
  ```
