#!/bin/bash

readonly _CONFIG_FILE="config.h"
readonly _KEYMAP_FILE="keymap.c"
readonly _RULES_FILE="rules.mk"
readonly _LOGO_FILE="glcdfont.c"
readonly _KEYBOARD_NAME="crkbd"
readonly _KEYMAP_NAME="flikendo"

readonly _LOGO_PATH="root/qmk_firmware/keyboards/$_KEYBOARD_NAME/lib/"
readonly _SUB_PATH="root/qmk_firmware/keyboards/$_KEYBOARD_NAME/keymaps/$_KEYMAP_NAME"
readonly _MAIN_PATH="root/qmk_firmware/keyboards/$_KEYBOARD_NAME/"


readonly _COMMAND='CMD ["/bin/bash"]'

readonly _GREEN='\033[0;32m'
readonly _RED='\033[0;31m'
readonly _NC='\033[0m'

function main()
{
  run_qmk
  create_keymap "$_KEYBOARD_NAME" "$_KEYMAP_NAME"
  modify_config
  modify_keymap
  modify_rules
  modify_logo
  compile
}

function run_qmk() {
    print "${_GREEN}Running QMK..."
    echo -e "y\ny\n" | qmk setup
}

function create_keymap() {
    local keyboard="$1"
    local keymap="$2"
    
    print "${_GREEN}Creating keymap..."
    
    if [ "$keyboard" == "" ]; then
		die "Keyboard parameter is empty"
    fi
    
    if [ "$keymap" == "" ]; then
		die "Keymap parameter is empty"
    fi
    
    echo -e "$keyboard\n$keymap\n" | qmk new-keymap
    
    print "${_GREEN}Created keymap..."
}

function modify_config() {
    if [ ! -d "$_SUB_PATH/" ]; then
        print "${_RED}${_SUB_PATH}/${_CONFIG_FILE} does not exists"
        die "'$_SUB_PATH' does not exists"
    fi
    
    print "${_GREEN}Modifying ${_SUB_PATH}/${_CONFIG_FILE}..."    
    print "${_NC}Coping ${_SUB_PATH}/${_CONFIG_FILE}..."
    cp "./$_CONFIG_FILE" "$_SUB_PATH"/ || (print "${_RED} No possible to copy ${_CONFIG_FILE} to ${_SUB_PATH}/" &&
                             die "Dying process...")    
    print "${_NC}Modified ${_CONFIG_FILE}..."
}


function modify_keymap() {    
    if [ ! -d "$_SUB_PATH/" ]; then
        print "${_RED}${_SUB_PATH}/${_KEYMAP_FILE} does not exists"
        die "'$_SUB_PATH' does not exists"
    fi
        
    print "${_GREEN}Modifying ${_SUB_PATH}/${_KEYMAP_FILE}..."    
    print "${_NC}Coping ${_SUB_PATH}/${_KEYMAP_FILE}..."
    cp "./$_KEYMAP_FILE" "$_SUB_PATH"/ || (print "${_RED} No possible to copy ${_KEYMAP_FILE} to ${_SUB_PATH}/" &&
                             die "Dying process...")
    print "${_NC}Modified ${_KEYMAP_FILE}..."
}

function modify_rules() {    
    if [ ! -d "$_MAIN_PATH" ]; then
        print "${_RED}${_MAIN_PATH}${_RULES_FILE} does not exists"
        die "'$_MAIN_PATH' does not exists"
    fi
        
    print "${_GREEN}Modifying ${_MAIN_PATH}${_RULES_FILE}..."    
    print "${_NC}Coping ${_MAIN_PATH}${_RULES_FILE}..."
    cp -f "./$_RULES_FILE" "$_MAIN_PATH" || (print "${_RED} No possible to copy ${_RULES_FILE} to ${_MAIN_PATH}" &&
                             die "Dying process...")
    print "${_NC}Modified ${_RULES_FILE}..."
}

function modify_logo() {
    if [ ! -d "$_LOGO_PATH" ]; then
        print "${_RED}${_LOGO_PATH}${_LOGO_FILE} does not exists"
        die "'$_LOGO_PATH' does not exists"
    fi
    
    print "${_GREEN}Modifying ${_LOGO_PATH}${_LOGO_FILE}..."         
    print "${_NC}Coping ${_LOGO_PATH}${_LOGO_FILE}..."
    cp "./$_LOGO_FILE" "$_LOGO_PATH" || (print "${_RED} No possible to copy ${_LOGO_FILE} to ${_LOGO_PATH}" &&
                             die "Dying process...")
    print "${_NC}Modified ${_LOGO_FILE}..."
}

function compile() {    
    print "${_GREEN}Compiling..."
    cd "$_MAIN_PATH"
    qmk compile -kb "$_KEYBOARD_NAME" -km "$_KEYMAP_NAME"
    print "${_NC}Compiled..."
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
