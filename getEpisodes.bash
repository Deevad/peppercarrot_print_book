#!/bin/bash

#this script is supposed to get you the last version of the pictures from pepper and carrot website.
#you'll need wget and unzip installed on your system.

#author: laurent valentin jospin (laurent.valentin@famillejospin.ch)
#license: public domain

wget http://www.peppercarrot.com/downloader.php?page=download\&l=en

unzip downloader.php?page=download\&l=en -d ./pages
rm downloader.php?page=download\&l=en
