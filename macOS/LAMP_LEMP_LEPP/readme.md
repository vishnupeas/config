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
# export PKG_CONFIG_PATH="/opt/homebrew/Cellar/icu4c@77/77.1/lib/pkgconfig"
```

### Redis

1. Install redis server and php extension

   ```sh
   brew install redis # for redis on macos
   pecl install redis # for php-redis
   ```

1. Install redis insight tool (optional) from [here](https://s3.amazonaws.com/redisinsight.download/public/latest-v3/Redis-Insight-mac-arm64.dmg) or from the official [website](https://redis.io/downloads/#Redis_Insight).

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
   brew install mysql
   ```

1. Secure MySQL Installation, change password

   ```sh
   mysql_secure_installation
   ```

1. Check if password has changed

   ```sh
   mysql -u root -p
   ```

### PhpMyAdmin

1. Install phpmyadmin

   ```sh
   brew install phpmyadmin
   ```

1. Configure **Nginx**

   ```sh
   ln -s /opt/homebrew/share/phpmyadmin /opt/homebrew/var/www/ # link /phpmyadmin route to install path
   vim /opt/homebrew/etc/nginx/nginx.conf # open nginx config file
   ```

   Update the default nginx config to contain this block.

   ```
   server {
         listen 80;
         listen [::]:80;
         server_name localhost;

         #access_log  logs/host.access.log  main;

         location / {
             root html;
             index index.php index.html index.htm;
         }

         #error_page  404              /404.html;

         # redirect server error pages to the static page /50x.html
         #
         error_page 500 502 503 504 /50x.html;
         location = /50x.html {
             root html;
         }

         # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
         #
         location ~ \.php$ {
             root html;
             fastcgi_pass 127.0.0.1:9000;
             fastcgi_index index.php;
             fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
             include fastcgi_params;
         }

         # deny access to .htaccess files, if Apache's document root
         # concurs with nginx's one
         #
         location ~ /\.ht {
             deny all;
         }
     }
   ```

   Restart nginx

   ```sh
   nginx -t # test config
   nginx -s reload # restart nginx
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

### Automate the flow

Make use of a shell script and automate the entire flow

```sh
cp ~/packages/config/ubuntu/LAMP_LEMP_LEPP/sitename.sh ~/
```
