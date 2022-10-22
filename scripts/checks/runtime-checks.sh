#!/bin/bash
root_dir=$(git rev-parse --show-toplevel)

function test_help_option() {
    for script in $root_dir/bin/lazycow*;
    do
        echo "Running $script with no argument, expecting help menus"
        source $script 1>&2 >lazycow.test.log
        if [[ $? -ne 0 ]];then
            echo "Tests failed" | cowsay
            cat error.txt
            rm -f error.txt
            echo 1
        else
            echo "Tests passed for $script"
        fi
    done
}

test_help_option