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

# lang parameter
lang="en"
if [[ "$1" =~ ^[a-z]{2}$ ]]; then
	lang="$1"
fi

if [ -e "${PWD}/lang/${lang}" ]; then
	echo "${Red}=> Error: Directory already exists: ${PWD}/lang/${lang}/pages/ ${Off}"
	exit
fi

mkdir -p "${PWD}/lang/${lang}/pages/" && \
	cp "${PWD}/lang/en/pages/"*.md "${PWD}/lang/${lang}/pages/" && \
	cp "${PWD}/lang/en/"*.sla "${PWD}/lang/${lang}/"

if [ ! -d "${PWD}/lang/${lang}/pages/" ] || [ ! -f "${PWD}/lang/${lang}/B01_A_cover.sla" ]; then
	echo "${Red}=> Error: Could not properly initialize directory: ${PWD}/lang/${lang}/ ${Off}"
	exit
fi

sed -i -- "s,\"en_GB\",\"${lang}\",g" "${PWD}/lang/${lang}/"*.sla
sed -i -- "s,pages/en_,pages/${lang}_,g" "${PWD}/lang/${lang}/"*.sla

echo "${Green}=> Success: Directory correctly initialised: ${PWD}/lang/${lang}/ ${Off}"

exit
