#!/bin/bash

repo_dir=$(dirname ${BASH_SOURCE[0]})

macos_tools=$repo_dir/macos-tools

if [[ ! -d $macos_tools ]]; then
    echo "Downloading latest macos-tools..."
    rm -Rf $macos_tools && git clone https://github.com/the-braveknight/macos-tools $macos_tools --quiet
fi

repo_plist=$repo_dir/org.the-braveknight.y530.plist
config_plist=$repo_dir/config_y530.plist

source $macos_tools/_hack_cmds.sh
