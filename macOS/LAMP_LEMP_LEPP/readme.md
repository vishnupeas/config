## STEPS

### Install 3 in 1

1. Install `php`, `composer`, `laravel`. Run this one time and close the terminal.

   ```sh
   /bin/bash -c "$(curl -fsSL https://php.new/install/mac/8.4)"
   ```

1. Remove php from the folder, so that you can control the CLI php version with manual installation. This will make sure you only use `laravel` and `composer` from the 3 in 1 package

   ```sh
   rm ~/.config/herd-lite/bin/php
   ```

1. Then run the same code again. For more details check [official doc](https://laravel.com/docs/11.x/installation)

### PHP

Install the latest version of php

```sh
brew install php
```

Install required extensions to work with php

```sh
brew install zlib # for extension compile properly
brew install pkg-config # for intl extension
brew install php-intl # starting from php 8.4, intl is a sperate formula
```

### Redis

```sh
brew install redis # for redis on macos
pecl install redis # for php-redis
```

### Composer

Install latest version of composer

```sh
brew install composer
```

### Nginx Web Server

1. Install Nginx

   ```sh
   brew install nginx
   ```

1. Disable starting Nginx on boot / Stopping it.

   If the nginx is already started then it will continue to run when you restart the computer. You can stop it so it doesn't run on boot.

   ```sh
   brew services stop nginx
   brew services list
   ```

### PostgreSQL

1. Install PostgreSQL

   ```sh
   brew install postgresql@18
   ```

### MySQL

1. Install MySQL and required extensions

   ```sh
   brew install mysql &&

   sudo apt install php8.2-mysql # Extension for mysql
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

### Optional - phpmyadmin

#### Case 1: Smooth Installation

1. Install phpmyadmin

   ```sh
   brew install phpmyadmin
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

- Make apache make use of the phpmyadmin apache.conf. This should enable you to use phpmyadmin

  ```sh
  sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
  sudo a2enconf phpmyadmin
  sudo systemctl reload apache2
  ```

- Optional - Configure phpmyadmin to use the database

  ```sh
  sudo vim /etc/phpmyadmin/config.inc.php
  ```

- Optional - Here, change the values on the file

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

### Setup Virtual Hosts

#### Nginx Server

In this step we are trying to configure `nginx` to serve a website that we want under a certain domain. By default `nginx` serves files under `/var/www/html/`. But we need the server to handle files in our custom file path.

- Edit `/etc/hosts`

  ```sh
  sudo vim /etc/hosts
  ```

  Now add all the domains in here eg:

  ```
  127.0.0.1 sitename.test
  ```

- Make a copy of default nginx file

  ```sh
  cd /etc/nginx/sites-available/
  sudo cp default sitename.test #filename is not significant
  sudonvim sitename.test
  ```

- Now replace the file with this content. Here i'm serving a laravel project, so the root files are served under `public` directory.

  ```
  server {
      listen 80;
      listen [::]:80;

      server_name sitename.test;
      root /home/elmiur/work/project/sitename/public;
      index index.php;

      add_header X-Frame-Options "SAMEORIGIN";
      add_header X-Content-Type-Options "nosniff";

      charset utf-8;

      location / {
          try_files $uri $uri/ /index.php?$query_string;
      }

      location = /favicon.ico { access_log off; log_not_found off; }
      location = /robots.txt  { access_log off; log_not_found off; }

      error_page 404 /index.php;

      location ~ \.php$ {
          include snippets/fastcgi-php.conf;
          fastcgi_pass unix:/var/run/php/php8.2-fpm.sock;

          fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
          include fastcgi_params;

          fastcgi_hide_header X-Powered-By;
      }

      location ~ /\.(?!well-known).* {
          deny all;
      }

      error_log /var/log/nginx/sitename.error.log;
  }
  ```

- Enable this configuration and restart nginx

  ```sh
  sudo ln -s /etc/nginx/sites-available/sitename.test /etc/nginx/sites-enabled/

  sudo nginx -t # to check nginx is working ok
  sudo systemctl restart nginx # restart after modifying
  ```

#### Apache Server

In this step we are trying to configure `apache` to host a website that we want to serve under a certain domain. By default `apache` serves files under `/var/www/html/`. But we need it to server the files in our custom file path.

- Edit `/etc/hosts`

  ```sh
  sudo vim /etc/hosts
  ```

  Now add all the domains in here eg:

  ```
  127.0.0.1 sitename.test
  ```

- Make a copy of default apache conf

  ```sh
  cd /etc/apache2/sites-enabled/
  sudo cp 000-default.conf sitename.conf #filename is not significant
  sudo vim sitename.conf
  ```

- Now replace the file with this content. Here i'm serving a laravel project, so the root files are served under `public` directory.

  ```conf
  <VirtualHost *:80>
      ServerAdmin webmaster@localhost
      ServerName sitename.test
      DocumentRoot /home/elmiur/work/projects/mysite/public

      <Directory /home/sitename/work/projects/mysite/public>
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
  sudo a2ensite sitename.conf

  sudo systemctl restart apache2 # for all modification
  ```

- Give permission to access storage. Because the application generates files like user data(profile image, other attachments), cache, logs etc... that needs to be served by web-servers like `apache` and `nginx` we need to give access to these folders inside project for the user group `www-data`. Here we are giving ownership to current user (can do anything with the data) and group ownership to `var-www` (can read and write).

  ```sh
  sudo chown -R $USER:www-data storage
  ```

- Make sure the project path is discoverable. Check that with

  ```sh
  namei /home/elmiur/work/project/mysite

  sudo chmod o+x /home/elmiur # If this is not discoverable, give persmission to the path with
  ```

### Automate the flow

Make use of a shell script and automate the entire flow

```sh
cp ~/packages/config/ubuntu/LAMP_LEMP_LEPP/sitename.sh ~/
```
