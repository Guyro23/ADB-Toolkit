#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

function takeScreenshot(){
    
    devcode=$1
    echo -e "\e[1;93mTaking screenshot '${FILENAME}'...\n\e[91m"
    adb -s $devcode shell screencap -p /sdcard/${FILENAME}
    echo -e "\e[1;92mProcess complete.\n"
}

function pullScreenshot(){
    
    devcode=$1
    echo -e "\e[1;93mPulling screenshot '${FILENAME}' from device...\n\e[91m"
    adb -s $devcode  pull /sdcard/${FILENAME} screenshot/${FILENAME}
    echo -e "\n\e[1;92mProcess complete.\n"
    
}

function deleteScreenshotFromDevice(){
    
    devcode=$1
    echo -e "\e[1;93mDeleting screenshot '${FILENAME}' from device...\n\e[91m"
    adb -s $devcode shell rm /sdcard/${FILENAME}
    echo -e "\e[1;92mProcess complete."
    exit 0
    
}


FILENAME="$2"

takeScreenshot "$1"
pullScreenshot "$1"
deleteScreenshotFromDevice "$1"