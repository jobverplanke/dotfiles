# Dotfiles

## How to

1. Clone repo
```shell
$ git clone https://github.com/jobverplanke/dotfiles.git
```

2. Run `bootstrap` script.
```shell
$ bash ~/.dotfiles/bootstrap
```

## Setup PHP

A couple of PHP extensions and packages that need to be installed manually

PHP Extensions
```shell
$ pecl channel-update pecl.php.net
$ pecl install igbinary-3.1.6
$ pecl install imagick-3.4.4
$ pecl install redis-5.3.2
$ pecl install pcov-1.0.6
$ pecl install xdebug-3.0.3
$ pecl install -D 'enable-sockets="no" enable-openssl="no" enable-http2="no" enable-mysqlnd="no" enable-swoole-json="no" enable-swoole-curl="no"' swoole
```

PHP Global Composer Packages 
```shell
$ composer global require laravel/installer
$ composer global require laravel/valet
```

Setup Laravel Valet
```shell
$ valet install
$ sudo valet trust
```

## Local PHP Development Server

### Docker

To access all the web-services on the Docker side, use `valet proxy` before accessing the urls.
This will create a Nginx configuration file for the domain `service.test`, proxying all requests to that domain through to the service HTTP server.

#### MySQL
- Port `33066` 
- Custom configuration:
```shell
$ export FORWARD_DB_PORT=33066
```

#### MeiliSearch
- Port: `7700`
- Custom configuration:
```shell
$ export FORWARD_MEILISEARCH_PORT=7700
```
- Web: https://meilisearch.test
```shell
$ valet proxy meilisearch.test http://127.0.0.1:7700
```

#### Redis
- Port: `6379`
- Custom configuration:
```shell
$ export FORWARD_REDIS_PORT=6379
```

#### MailHog
- Port: `1025` & `8025`
- Custom configuration
```shell 
$ export FORWARD_MAILHOG_PORT=1025
$ export FORWARD_MAILHOG_DASHBOARD_PORT=8025
```

- Web: https://mail.test
```shell
$ valet proxy mail.test http://127.0.0.1:8025
```

#### MinIO
- Port: `9001`
- Custom configuration: 
```shell
$ export FORWARD_MINIO_PORT=9001
```
- Web: https://cloud-storage.test
```shell
$ valet proxy cloud-storage.test http://127.0.0.1:9001
```

#### Configuring for a Laravel application
To get MailHog working with your Laravel application, update the following keys in your `.env` file
```dotenv
MAIL_DRIVER=smtp
MAIL_HOST=mailhog #(container name)
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
```
The MailHog UI will run at port `8025` and the SMTP server will run at `1025`.

## Known issues
After reboot PHP-FPM is back at version 7.3, [the fix can be found here](https://github.com/laravel/valet/issues/906)

## Resources
- [Blog post](https://driesvints.com/blog/getting-started-with-dotfiles) of Dries Vints about dotfile
- [Dotfiles Github repository](https://github.com/freekmurze/dotfiles) of Freek Van der Herten
- https://github.com/ryanoasis/nerd-fonts
- http://nerdfonts.com/#cheat-sheet

