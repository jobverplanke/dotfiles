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

## Resources
- [Blog post](https://driesvints.com/blog/getting-started-with-dotfiles) of Dries Vints about dotfile
- [Dotfiles Github repository](https://github.com/freekmurze/dotfiles) of Freek Van der Herten
- https://github.com/ryanoasis/nerd-fonts
- http://nerdfonts.com/#cheat-sheet

