#!/bin/bash

# Pages downloader
# ================
# This script is supposed to get you the last version of the pictures from pepper and carrot website.
# Dependencies: you'll need wget and unzip installed on your system.

# author: laurent valentin jospin (laurent.valentin@famillejospin.ch) ; david revoy (info@davidrevoy.com)
# license: public domain

clear

# colors
Off=$'\e[0m'
Red=$'\e[1;31m'
Green=$'\e[1;32m'
Blue=$'\e[1;34m'

# configuration
lang="en"
urlpath="https://www.peppercarrot.com/downloader.php?page=download\&l=""$lang"
file="peppercarrot-render-pack.zip"
horodate=$(date +%Y-%m-%d_%Hh%M)
tmppath="/tmp/$horodate-pagedownloader"
workingpath="${PWD}"

if [ ! -d "$workingpath"/"pages" ]; then
   echo "${Red}=> Error : No directory -pages- found. Please execute the script in the sources directory. ${Off}"
   exit
fi

echo "${Green}=> Downloading the [$lang] archive from peppercarrot.com .${Off}"
echo "${Blue}   Note: it's a 400MB download, it can be long.${Off}"
echo ""
mkdir "$tmppath"
echo "wget" "$urlpath" "-O" "$tmppath"/"$file"
wget "$urlpath" -O "$tmppath"/"$file"

if [ -f "$tmppath"/"$file" ]; then
   unzip -o "$tmppath"/"$file" -d "$workingpath"/"pages"
   echo "${Green}=> Unzip archive done. ${Off} "
   rm "$tmppath"/"$file"
else
   echo "=> Downloading ${Red} Error: $file is missing. ${Off} "
fi

echo ""

if [ -f ""$workingpath"/pages/"$lang"_Pepper-and-Carrot_by-David-Revoy_E01P00.png" ]; then
   echo "=> Test: ${Green}Success !${Off} All is done."
   echo ""
else
   echo "=> Test: ${Red} Error. Check test failed. ${Off} "
   echo "   Something didn't work in the process... Please report a bug here: https://github.com/Deevad/peppercarrot_print_book01/issues "
   echo "   Debug: ""$workingpath"/"pages"
   echo ""
fi

rm -rf "$tmppath"
exit
