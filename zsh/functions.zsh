# Switch PHP versions
phpv() {
    if [ $1 = "7.4" ]; then
        valet use php@7.4
    else
        valet use php@$1
    fi

    composer global update
    source ~/.zshrc
}

