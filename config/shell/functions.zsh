# Switch PHP versions
phpv() {
    if [ $1 = "7.4" ]; then
        valet use php
    else
        valet use php@$1
    fi

    composer global update
    source ~/.zshrc
}

function db {
    if [ "$1" = "refresh" ]; then
        mysql -uroot -e "drop database $2; create database $2"
    elif [ "$1" = "create" ]; then
        mysql -uroot -e "create database $2"
    elif [ "$1" = "drop" ]; then
        mysql -uroot -e "drop database $2"
    fi
}

