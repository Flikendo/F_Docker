# F_QMK
This a Docker project. It contains a Dockerfile to create QMK images thus containers.

With QMK we will be able to create and compile our own keymap for CRKBD keyboard.

INFO: https://docs.qmk.fm/#/

***

## Run QMK Setup
```
qmk setup
```

## Building Your First Firmware
### Create a New Keymap
To create your own keymap you’ll want to create a copy of the default keymap. If you configured 
your build environment in the last step you can do that easily with the QMK CLI:

```
qmk new-keymap
```
Some inputs appear "Keyboard Name" will be "crkbd" (Corne Keyboard) and "Keymap Name" will be e.g: "flikendo"

### Open keymap.c
Run next command. Change "flikendo" for your keymap name.

```
cd root/qmk_firmware/keyboards/crkbd/keymaps/flikendo/
```

There are 3 files in this directory config.h, keymap.c and rules.mk
#### config.h
Some leveless keyboard's functionality.

#### keymap.c
In this file the logic of our keyboard is stored. We have to modify this file in order to change the keyboard's function.

#### rules.mk
Enable or disable some keyboard's options

***

### Modify logo
```
vi /qmk_firmware/keyboards/crkbd/lib/glcdfont.c
```

Go to https://helixfonteditor.netlify.app/ in this website we are loading the file which contains the fonts.

***

### Compile the Firmware
- Keyboard = crkbd
- Keymap = flikendo

```
cd /root/qmk_firmware/keyboards/crkbd/keymaps/flikendo
qmk compile -kb <keyboard> -km <keymap>
```
