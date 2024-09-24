## Steps

### Pre-Requisite

```sh
sudo apt update && sudo sudo apt upgrade
```

### PHP

```sh
sudo apt install php libapache2-mod-php php-mysql &&
php -v
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
