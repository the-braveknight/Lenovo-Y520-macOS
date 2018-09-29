#!/bin/bash

repo_dir=$(dirname ${BASH_SOURCE[0]})

macos_tools=$repo_dir/macos-tools

if [[ ! -d $macos_tools ]]; then
    echo "Downloading latest macos-tools..."
    rm -Rf $macos_tools && git clone https://github.com/the-braveknight/macos-tools $macos_tools --quiet
fi

downloads_dir=$repo_dir/Downloads
local_kexts_dir=$repo_dir/Kexts
hotpatch_dir=$repo_dir/Hotpatch/Downloads
repo_plist=$repo_dir/org.the-braveknight.y520.plist

source $macos_tools/_hack_cmds.sh

case "$1" in
    --install-config-y520)
        installConfig $repo_dir/config_y520.plist
    ;;
    --install-config-y720)
         installConfig $repo_dir/config_y720.plist
    ;;
    --update-config-y520)
        updateConfig $repo_dir/config_y520.plist
    ;;
    --update-config-y720)
         updateConfig $repo_dir/config_y720.plist
    ;;
esac
