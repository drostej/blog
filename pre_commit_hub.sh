#!/usr/local/bin/bash

changed_ruby_files=$(git show --pretty="" --name-only --diff-filter=ACMR | grep ".*rb$" || true)
if [[ -n "$changed_ruby_files" ]]
then
    echo "Changed ruby files: $changed_ruby_files"
    rufo $changed_ruby_files
    exit_status=$?

    if [ $exit_status -eq 3 ]
    then
        echo "Ruby files do not match rufo formater rules " $exit_status
    fi
else
    echo "No ruby files changes found."
fi