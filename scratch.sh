#!/usr/local/bin/bash

changed_ruby_files=$(git show --pretty="" --name-only --diff-filter=ACMR | grep ".*rb$" || true)
if [[ -n "$changed_ruby_files" ]]
then
    echo "Reformatting Ruby files: $changed_ruby_files"
    echo $((rufo $changed_ruby_files))
    if ! rufo $changed_ruby_files
    then
        echo "Some files were changed, aborting commit!" >&2
        exit 1
    fi
else
    echo "No ruby files changes found."
fi