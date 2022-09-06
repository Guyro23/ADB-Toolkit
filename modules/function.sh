#!/bin/bash

## CLEANER FUNCTION ##

clean_exit() {

  rm -rf "$PWD"/.temp/* &>/dev/null
  rm -rf "$PWD"/1 &>/dev/null
  rm -rf "$PWD"/2 &>/dev/null
  clear && echo -e "\nCtrl-C caught...Performing Clean Up Thanks for Using.\n" && sleep 1s
  echo -e "Exiting the ADB-Toolkit, Thanks for using."
  echo -e "\nDONE"
  exit

}

trap_ctrlc() {
  clean_exit
}

trap "trap_ctrlc" 2

function banner() {

  COLUMNS=$(tput cols)

  banner_width=94
  banner2_width=52
  banner3_width=11

  banner_bottom_width=28
  banner3_bottom_width=15

  if ((banner_width <= COLUMNS)); then

    indent_main=$(((COLUMNS - banner_width) / 2))
    indent_bottom=$(((COLUMNS - banner_bottom_width) / 2))

    prefix=''

    for ((i = 1; i <= indent_main; i++)); do
      prefix+=' '
    done

    prefix_bottom=''
    for ((j = 1; j <= indent_bottom; j++)); do
      prefix_bottom+=' '
    done

    echo -e "\e[1;93m
${prefix} █████╗ ██████╗ ██████╗               ████████╗ ██████╗  ██████╗ ██╗     ██╗  ██╗██╗████████╗
${prefix}██╔══██╗██╔══██╗██╔══██╗              ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██║ ██╔╝██║╚══██╔══╝
${prefix}███████║██║  ██║██████╔╝    █████╗       ██║   ██║   ██║██║   ██║██║     █████╔╝ ██║   ██║
${prefix}██╔══██║██║  ██║██╔══██╗    ╚════╝       ██║   ██║   ██║██║   ██║██║     ██╔═██╗ ██║   ██║
${prefix}██║  ██║██████╔╝██████╔╝                 ██║   ╚██████╔╝╚██████╔╝███████╗██║  ██╗██║   ██║
${prefix}╚═╝  ╚═╝╚═════╝ ╚═════╝                  ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝   ╚═╝\n
${prefix_bottom}\e[93mMade with \e[1;91m❤️ \e[93mby \e[1;91mASHWINI SAHU\e[0m
    \e[0m"

  elif ((banner_bottom_width <= COLUMNS)); then

    indent_main=$(((COLUMNS - banner2_width) / 2))
    indent_bottom=$(((COLUMNS - banner_bottom_width) / 2))

    prefix=''

    for ((i = 1; i <= indent_main; i++)); do
      prefix+=' '
    done
    prefix_bottom=''
    for ((j = 1; j <= indent_bottom; j++)); do
      prefix_bottom+=' '
    done

    echo -e "\e[1;93m
${prefix}   ___   ___  ___     ______          ____    _ __
${prefix}  / _ | / _ \/ _ )___/_  __/__  ___  / / /__ (_) /_
${prefix} / __ |/ // / _  /___// / / _ \/ _ \/ /  '_// / __/
${prefix}/_/ |_/____/____/    /_/  \___/\___/_/_/\_\/_/\__/\n
${prefix_bottom}\e[93mMade with \e[91m❤️ \e[93mby \e[91mASHWINI SAHU\n
    \e[0m"
  else
    indent_main=$(((COLUMNS - banner3_width) / 2))
    indent_bottom=$(((COLUMNS - banner3_bottom_width) / 2))

    prefix=''

    for ((i = 1; i <= indent_main; i++)); do
      prefix+=' '
    done

    prefix_bottom=''
    for ((j = 1; j <= indent_bottom; j++)); do
      prefix_bottom+=' '
    done

    echo -e "${prefix}\e[1;93mADB-Toolkit\e[0m\n"
    echo -e "${prefix_bottom}By Ashwini Sahu"
  fi

}

option_list() {

  banner
  echo -e "\n\n\e[1;4;91mCHOOSE THE OPTIONS GIVEN BELOW\e[0m\n\n"
  echo -e "\e[1;93m1.   \e[1;92mSHOW CONNECTED DEVICES                           \e[1;93m24.  \e[1;92mPUT A FILE IN DEVICE "
  echo -e "\e[1;93m2.   \e[1;92mRESTART ADB SERVICE "
  echo -e "\e[1;93m3.   \e[1;92mREBOOT SYSTEM"
  echo -e "\e[1;93m4.   \e[1;92mREBOOT TO RECOVERY MODE                          \e[1;93m25.  \e[1;91mGO TO METASPLOIT SECTION "
  echo -e "\e[1;93m5.   \e[1;92mREBOOT TO FASTBOOT/BOOTLOADER MODE \n"
  echo -e "\e[1;93m6.   \e[1;92mSTART A INTERACTIVE SHELL                        \e[1;93m26.  \e[1;92mLAUNCH AN APPLICATION "
  echo -e "\e[1;93m7.   \e[1;92mDUMP SYSTEM INFORMATION (Messy)                  \e[1;93m27.  \e[1;92mCHECK IS PHONE ROOTED OR NOT "
  echo -e "\e[1;93m8.   \e[1;92mDUMP CPU INFORMATION (Messy)                     \e[1;93m28.  \e[1;92mHANG THE PHONE "
  echo -e "\e[1;93m9.   \e[1;92mDUMP MEMORY INFORMATION (Messy)                  \e[1;93m29.  \e[1;92mSEND SMS FROM THE PHONE "
  echo -e "\e[1;93m10.  \e[1;92mGET PHONE DETAILS"
  echo -e "\e[1;93m11.  \e[1;92mCAPTURE BUG REPORT"
  echo -e "\e[1;93m12.  \e[1;92mINSTALL AN PACAKAGE 'apk'"
  echo -e "\e[1;93m13.  \e[1;92mUNINSTALL AN PACKAGE"
  echo -e "\e[1;93m14.  \e[1;92mLIST ALL INSTALLED PACKAGE"
  echo -e "\e[1;93m15.  \e[1;92mSEE LIVE LOG OF DEVICE"
  echo -e "\e[1;93m16.  \e[1;92mESTABLISH A REMOTE CONNECTION WITH THE DEVICE\n"
  echo -e "\e[1;93m17.  \e[1;92mCAPTURE A SCREENSHOT ANONYMOUSLY"
  echo -e "\e[1;93m18.  \e[1;92mRECORD THE SCREEN ANONYMOUSLY"
  echo -e "\e[1;93m19.  \e[1;92mCOPY ALL THE CAMERA PHOTOS"
  echo -e "\e[1;93m20.  \e[1;92mCOPY ALL THE DOWNLOADS"
  echo -e "\e[1;93m21.  \e[1;92mCOPY ALL WHATSAPP DATA"
  echo -e "\e[1;93m22.  \e[1;92mCOPY ALL DEVICE STORAGE ( Takes time )           \e[1;93mA.  \e[1;92mABOUT AUTHOUR "
  echo -e "\e[1;93m23.  \e[1;92mCOPY A SPECIFIED FILE OR FOLDER                  \e[1;91mEXIT or press Ctrl+c\n"
  echo -e "$revised"
  read -rp $'\e[1;4;91mSELECT ONE OF THE OPTIONS WITH THE RESPECTED NUMBER\e[0m\e[24;1;97m : ' options

}

## CALLING THE option list function once

revised=""
option_list

## THE LOOP STARTS FROM HERE

while true; do

  case $options in

  "1")
    echo -e
    bash modules/opt1
    ;;
  "2")
    echo -e
    bash modules/opt2
    ;;
  "3")
    echo -e
    bash modules/opt3
    ;;
  "4")
    echo -e
    bash modules/opt4
    ;;
  "5")
    echo -e
    bash modules/opt5
    ;;
  "6")
    echo -e
    bash modules/opt6
    ;;
  "7")
    echo -e
    bash modules/opt7
    ;;
  "8")
    echo -e
    bash modules/opt8
    ;;
  "9")
    echo -e
    bash modules/opt9
    ;;
  "10")
    echo -e
    bash modules/opt10
    ;;
  "11")
    echo -e
    bash modules/opt11
    ;;
  "12")
    echo -e
    bash modules/opt12
    ;;
  "13")
    echo -e
    bash modules/opt13
    ;;
  "14")
    echo -e
    bash modules/opt14
    ;;
  "15")
    echo -e
    bash modules/opt15
    ;;
  "16")
    echo -e
    bash modules/opt16
    ;;
  "17")
    echo -e
    bash modules/opt17
    ;;
  "18")
    echo -e
    bash modules/opt18
    ;;
  "19")
    echo -e
    bash modules/opt19
    ;;
  "20")
    echo -e
    bash modules/opt20
    ;;
  "21")
    echo -e
    bash modules/opt21
    ;;
  "22")
    echo -e
    bash modules/opt22
    ;;
  "23")
    echo -e
    bash modules/opt23
    ;;
  "24")
    echo -e
    bash modules/opt24
    ;;
  "25")
    echo -e
    bash modules/function2.sh
    break
    ;;
  "26")
    echo -e
    bash modules/opt26
    ;;
  "27")
    echo -e
    bash modules/opt27
    ;;
  "28")
    echo -e
    bash modules/opt28
    ;;
  "29")
    echo -e
    bash modules/opt29
    ;;
  "A")
    echo -e
    bash modules/about
    ;;
  "a")
    echo -e
    bash modules/about
    ;;

  *)
    clear
    revised="\e[1;4;91mENTER THE RIGHT OPTION BRO :-)\n"
    option_list
    ;;

  esac

done

#### END OF THIS SCRIPT ####
