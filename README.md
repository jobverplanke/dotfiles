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
$ pecl install redis-5.3.2
$ pecl install pcov-1.0.6
$ pecl install imagick-3.4.4
```

PHP Global Composer Packages 
```shell
$ composer global require laravel/installer
$ composer global require laravel/valet
$ composer global require spatie/mixed-content-scanner-cli
```

Setup Laravel Valet
```shell
$ valet install
$ sudo valet trust
```

## Local Mail Server
Install MailHog via Brew to use a local mail server for testing

#### Setting up .test domain
Run the following command to tell Valet to set up a `.test` domain for the local mail server.
```shell
$ valet proxy mail.test http://127.0.0.1:8025
```
This will create a Nginx configuration file for the domain `mail.test`, proxying all requests to that domain through to the MailHog HTTP server.

#### Configuring for a Laravel application
To get MailHog working with your Laravel application, update the following keys in your `.env` file
```dotenv
MAIL_DRIVER=smtp
MAIL_HOST=127.0.0.1
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
```
The MailHog UI will run at port `8025` and the SMTP server will run at `1025`.

## Resources
- [Blog post](https://driesvints.com/blog/getting-started-with-dotfiles) of Dries Vints about dotfile
- [Dotfiles Github repository](https://github.com/freekmurze/dotfiles) of Freek Van der Herten
- https://github.com/ryanoasis/nerd-fonts
- http://nerdfonts.com/#cheat-sheet

