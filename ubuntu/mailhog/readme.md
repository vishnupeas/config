# Mailhog

Mailhog is a email testing tool that mimicks SMTP server for local use.

## Installing Mailhog

1. Find the git repository here - [https://github.com/mailhog/MailHog](https://github.com/mailhog/MailHog). Download the latest version for your operating system. This documentation is for `Ubuntu 22.04 LTS`.

   You can either run the executable file doing `./MailHog_linux_amd64` to use it immediately or turn it into a `systemd` service for better management later on.

1. Move it to `/usr/local/bin` and rename it as mailhog

   ```sh
   sudo mv MailHog_linux_amd64 /usr/local/bin/mailhog
   ```

1. Make it executable

   ```sh
   sudo chmod +x /usr/local/bin/mailhog
   ```

1. Create a new service for `systemd`

   ```sh
   sudo vim /etc/systemd/system/mailhog.service
   ```

1. Paste the following in `mailhog.service`

   ```
   [Unit]
   Description=MailHog Service
   After=network.target

   [Service]
   ExecStart=/usr/local/bin/mailhog
   Restart=always
   User=root
   Group=root
   Environment=PATH=/usr/local/bin:/usr/bin:/bin
   Environment=MAILHOG_SMTPLISTEN=127.0.0.1:1025
   Environment=MAILHOG_API_BINDADDR=127.0.0.1:8025

   [Install]
   WantedBy=multi-user.target
   ```

1. Restart `systemd`

   ```sh
   sudo systemctl daemon-reload
   ```

1. Use `systemd` start / stop / status of `mailhog`. The service must be visible in localhost post `8025` and the SMTP server at `1025`
