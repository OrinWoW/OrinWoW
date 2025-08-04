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

add-module repo name:
    git submodule add -f {{repo}} modules/{{name}}
    git add .gitmodules
    git add modules/{{name}}
    git commit -m "Add {{name}}"
