#!/bin/bash

root_dir=$(git rev-parse --show-toplevel)
prefix="lazycow-"
fail_counts=0
expected_perms=700
cd $root_dir/bin
function init() {
    echo "Running pre-merge checks on all scripts"
    for curr_script_name in *;
    do
        echo "Found script $curr_script_name"
        perform_filename_check $curr_script_name
        perform_extension_check $curr_script_name
        perform_permission_check $curr_script_name
        if [[ $fail_counts -gt 0 ]];then
            echo "X Some tests have failed for $curr_script_name"
            echo 1
        else 
            echo "Tests passed for $curr_script_name"
            exit 0
        fi
    done
}

function get_suffix() {
    echo $1 | awk '{split($0,arr,'"\"${prefix}\""'); print arr[2]}'
}

function perform_filename_check() {
    local curr_script_name=${1%.*}
    local script_suffix=$(get_suffix $curr_script_name)
    local expected_file_name="$curr_script_name"
    if [[ $expected_file_name != $curr_script_name ]];then
        # increment count
        fail_counts=$(($fail_counts + 1))
        echo "[FAILED] Expected file name to be ($expected_file_name) but was ($curr_script_name.$ext)"
    else
        echo "Check has passed"
    fi
}

function perform_extension_check() {
    local ext=${1##*.}
    if [[ $ext != "$1" ]];then
        fail_counts=$(($fail_counts + 1))
        echo "[FAILED] Expected no extension but found out to be ($ext)"
    else
        echo "Check has passed"
    fi
}

function perform_permission_check() {
    actual_permission=$(stat -c '%a' "$1")
    if [[ $actual_permission == $expected_perms ]];then
        echo "[FAILED] Expected Permissions ($expected_perms) but found out to be ($perms_octal)"
        fail_counts=$(($fail_counts + 1))
    else
        echo "Check has passed"
    fi
}

init