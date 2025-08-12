[private]
@default:
    just --list

setup:
    ./acore.sh compiler 3

start:
    ./acore.sh docker start:app:d

rebuild: stop
    ./acore.sh docker rebuild

stop:
    docker compose down

[no-exit-message]
@attach:
    echo "Remember to Ctrl+P then Ctrl+Q to detach safely!"
    ./acore.sh docker attach ac-worldserver

# Deletes the "acore_world" database, which causes its full reconstruction upon next server start
purge-world: stop
    docker compose up --detach --wait ac-database
    docker exec -it ac-database \
        mysql -u root -ppassword -e "DROP DATABASE IF EXISTS acore_world;"
    just stop

add-module repo name:
    git submodule add -f {{repo}} modules/{{name}}
    git add .gitmodules
    git add modules/{{name}}
    git commit -m "Add {{name}}"
