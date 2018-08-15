#!/bin/bash

#set -x

downloads=Downloads

local_kexts_dir=Kexts
kexts_dir=$downloads/Kexts

kexts_exceptions="Sensors|FakePCIID_BCM57XX|FakePCIID_Intel_GbX|FakePCIID_XHCIMux|FakePCIID_Intel_HD_Graphics|FakePCIID_AR9280_as_AR946x|BrcmFirmwareData|PatchRAM.kext"

tools_dir=$downloads/Tools

hotpatch_dir=Hotpatch/Downloads

hda_codec=ALC235
hda_resources=Resources_$hda_codec

if [[ ! -d macos-tools ]]; then
    echo "Downloading latest macos-tools..."
    rm -Rf macos-tools && git clone https://github.com/the-braveknight/macos-tools --quiet
fi

function findKext() {
    find $kexts_dir $local_kexts_dir -name $1 -not -path \*/PlugIns/* -not -path \*/Debug/*
}

case "$1" in
    --download-tools)
        rm -Rf $tools_dir && mkdir -p $tools_dir

        macos-tools/bitbucket_download.sh -a RehabMan -n os-x-maciasl-patchmatic -o $tools_dir
        macos-tools/bitbucket_download.sh -a RehabMan -n os-x-maciasl-patchmatic -f RehabMan-patchmatic -o $tools_dir
        macos-tools/bitbucket_download.sh -a RehabMan -n acpica -o $tools_dir
    ;;
    --download-kexts)
        rm -Rf $kexts_dir && mkdir -p $kexts_dir

        # Bitbucket kexts
        macos-tools/bitbucket_download.sh -a RehabMan -n os-x-fakesmc-kozlek -o $kexts_dir
        macos-tools/bitbucket_download.sh -a RehabMan -n os-x-realtek-network -o $kexts_dir
        macos-tools/bitbucket_download.sh -a RehabMan -n os-x-fake-pci-id -o $kexts_dir
        macos-tools/bitbucket_download.sh -a RehabMan -n os-x-voodoo-ps2-controller -o $kexts_dir
        macos-tools/bitbucket_download.sh -a RehabMan -n os-x-acpi-battery-driver -o $kexts_dir
        macos-tools/bitbucket_download.sh -a RehabMan -n os-x-brcmpatchram -o $kexts_dir
        macos-tools/bitbucket_download.sh -a RehabMan -n os-x-usb-inject-all -o $kexts_dir
        macos-tools/bitbucket_download.sh -a RehabMan -n os-x-eapd-codec-commander -o $kexts_dir
    ;;
    --download-hotpatch)
        rm -Rf $hotpatch_dir && mkdir -p $hotpatch_dir

        macos-tools/hotpatch_download.sh -o $hotpatch_dir SSDT-IGPU.dsl
        macos-tools/hotpatch_download.sh -o $hotpatch_dir SSDT-PNLF.dsl
        macos-tools/hotpatch_download.sh -o $hotpatch_dir SSDT-XOSI.dsl
        macos-tools/hotpatch_download.sh -o $hotpatch_dir SSDT-XCPM.dsl
    ;;
    --install-apps)
    	macos-tools/unarchive_file.sh -d $tools_dir
        macos-tools/install_app.sh -d $tools_dir
    ;;
    --install-binaries)
    	macos-tools/unarchive_file.sh -d $tools_dir
        macos-tools/install_binary.sh -d $tools_dir
    ;;
    --install-kexts)
    	macos-tools/unarchive_file.sh -d $kexts_dir
        macos-tools/install_kext.sh -d $kexts_dir -e $kexts_exceptions
        $0 --install-hdainjector
        $0 --install-backlightinjector
        $0 --install-voodootscsync
        $0 --update-kernelcache
    ;;
    --install-essential-kexts)
    	macos-tools/unarchive_file.sh -d $kexts_dir
        macos-tools/install_kext.sh -i $(findKext FakeSMC.kext) $(findKext RealtekRTL8111.kext) $(findKext FakePCIID.kext) $(findKext FakePCIID_Broadcom_WiFi.kext) $(findKext USBInjectAll.kext) $(findKext ACPIBatteryManager.kext) $(findKext VoodooPS2Controller.kext)
    ;;
    --install-hdainjector)
        macos-tools/create_hdainjector.sh -c $hda_codec -r $hda_resources -o $local_kexts_dir
        macos-tools/install_kext.sh $local_kexts_dir/AppleHDA_$hda_codec.kext
    ;;
    --install-backlightinjector)
        macos-tools/install_kext.sh $local_kexts_dir/AppleBacklightInjector.kext
    ;;
    --install-voodootscsync)
        macos-tools/install_kext.sh $local_kexts_dir/VoodooTSCSync.kext
    ;;
    --update-kernelcache)
        sudo kextcache -i /
    ;;
    --install-config)
        macos-tools/install_config.sh config.plist
    ;;
    --update-config)
        macos-tools/install_config.sh -u config.plist
    ;;
    --update)
    	echo "Checking for updates..."
        git stash --quiet && git pull
        echo "Checking for macos-tools updates..."
        cd macos-tools && git stash --quiet && git pull && cd ..
    ;;
    --download-requirements)
        $0 --download-kexts
        $0 --download-tools
        $0 --download-hotpatch
    ;;
    --install-downloads)
        $0 --install-binaries
        $0 --install-apps
        $0 --install-essential-kexts
        $0 --install-kexts
    ;;
esac
