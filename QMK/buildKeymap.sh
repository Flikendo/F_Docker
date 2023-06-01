p#!/bin/bash

readonly _CONFIG_FILE="config.h"
readonly _KEYMAP_FILE="keymap.c"
readonly _RULES_FILE="rules.mk"
readonly _KEYBOARD_NAME="crkbd"
readonly _KEYMAP_NAME="flikendo"
readonly _CONFIG_PATH=""
readonly _KEYMAP_PATH=""
readonly _RULES_PATH=""
readonly _FOLDER="root/qmk_firmware/keyboards/'$_KEYBOARD_NAME'/keymaps/'$_KEYMAP_NAME'"

readonly _COMMAND='CMD ["/bin/bash"]'

readonly _GREEN='\033[0;32m'
readonly _RED='\033[0;31m'
readonly _NC='\033[0m'

function main()
{
  run_qmk
  create_keymap "$_KEYBOARD_NAME" "$_KEYMAP_NAME"
  modify_keymap
  modify_logo
  compile
}

function run_qmk() {
    print "${_GREEN}Running QMK\t..."
    qmk setup
    print "${_NC}Would you like to clone qmk/qmk_firmware to /root/qmk_firmware? [y/n] \t..."
    yes
    print "${_NC}After YES\t..."
    Would you like to install dependencies? [Y/n]
    print "${_NC}Would you like to install dependencies? [Y/n]\t..."
    yes
    print "${_NC}After YES\t..."

}

function create_keymap() {
    local keyboard="$1"
    local keymap="$2"
    
    print "${_NC}Creating keymap\t..."
    qmk new-keymap
    
    if [ "$keyboard" == "" ]; then
		die "Keyboard parameter is empty"
    fi
    
    if [ "$keymap" == "" ]; then
		die "Keymap parameter is empty"
    fi
    
    echo "$1"
    echo "$2"
    
    print "${_GREEN}Created keymap\t..."
}

function modify_keymap() {
    print "${_NC}Moving to {$_FOLDER}\t..."
    
    if [ ! -d "$_FOLDER"/ ]; then
        print "${_RED}{$_FOLDER} does not exists\t"
        die "'$folder' does not exists"
    fi
    
    cd "$_FOLDER"/   
        
    print "${_GREEN}Moved to {$_FOLDER}\t..."
    print "${_NC}Modifying keymap\t..."
    cp "$_CONFIG_FILE" . || (print "${_RED} No possible to copy {$_CONFIG_FILE} to {$_FOLDER}\t" &&
                             die "Dying process...")
    cp "$_KEYMAP_FILE" . || (print "${_RED} No possible to copy {$_KEYMAP_FILE} to {$_FOLDER}\t" &&
                             die "Dying process...")
    cp "$_RULES_FILE" . || (print "${_RED} No possible to copy {$_RULES_FILE} to {$_FOLDER}\t" &&
                             die "Dying process...")
    print "${_GREEN}Modified keymap\t..."
}

function modify_logo() {
    print "${_NC}Modifying logo\t..."
    vi /qmk_firmware/keyboards/"_KEYBOARD_NAME"/lib/glcdfont.c
    print "${_GREEN}Modified logo\t..."
}

function compile() {    
    print "${_NC}Compiling\t..."
    cd /"$_FOLDER"
    qmk compile -kb "$_KEYBOARD_NAME" -km "$_KEYMAP_NAME"
    print "${_NC}Compiled\t..."
}

function warn()
{
  print "$@" >&2;
}

function die()
{
  warn "${_RED}Fatal:${_NC} $@"; exit 1;
}

function print()
{
  echo -e "$@"
}

main "$@"
