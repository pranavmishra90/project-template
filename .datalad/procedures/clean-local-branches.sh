#!/bin/bash

git fetch --prune

current_branches=$(git branch --format='%(refname:short)')
echo "Current local branches:"
echo "$current_branches"

echo "Deleting local branches that are already merged into main or master..."
branches=$(git branch -vv | grep ': gone]' | awk '{print $1}')

if [ -n "$branches" ]; then
    echo "$branches" | xargs git branch -d
fi

echo "done"