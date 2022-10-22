#!/bin/bash
root_dir=$(git rev-parse --show-toplevel)

function test_help_option() {
    for script in $root_dir/bin/*;
    do
        echo "[simulate] Testing script $script"
        echo "Running with no argument, expecting help menus"
        source $script 1>&2 >error.txt
        if [[ $? -ne 0 ]];then
            echo "Tests failed" | lolcat
            cat error.txt
            rm -f error.txt
            echo 1
        fi
    done
}

test_help_option