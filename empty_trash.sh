#!/bin/bash

[ -d ~/.local/share/Trash ] && rm -rf ~/.local/share/Trash/* && echo "Emptied Shared Trash"
[ -d ~/.Trash ] && rm -rf ~/.Trash/* && echo "Emptied Trash" # Mac and some systems