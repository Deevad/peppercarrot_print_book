#!/bin/bash

#: Title       : kra-to-png util
#: Author      : David REVOY < info@davidrevoy.com >, Mjtalkiewicz (aka Player_2)
#: License     : GPL

# usage: copy this script along a folder of Krita files *.kra and execute (double-click?)
# best usage with 'run inside a terminal'
# exported *.png with same name will be created on the fly ( and sRGB profile )

scriptversion="0.1"

# Utils
export projectname="${PWD##*/}"
export workingpath="${PWD}"
export isodate=$(date +%Y-%m-%d)
export version=$(date +%Y-%m-%d_%Hh%M)
export versiondaily=$(date +%Y%m%d)
export Off=$'\e[0m'
export Purple=$'\e[1;35m'
export Blue=$'\e[1;34m'
export Green=$'\e[1;32m'
export Red=$'\e[1;31m'
export Yellow=$'\e[1;33m'
export White=$'\e[1;37m'
export BlueBG=$'\e[1;44m'
export RedBG=$'\e[1;41m'
export PurpleBG=$'\e[1;45m'
export Black=$'\e[1;30m'

# Windows title
printf "\033]0;%s\007\n" "*Extracting: $projectname"

clear

_display_ui()
{
  echo ""
  echo " ${White}${BlueBG}                                                                ${Off}"
  echo " ${White}${BlueBG}                         -= KRA-to-PNG =-                       ${Off}"
  echo " ${White}${BlueBG}                                                                ${Off}"
  echo ""
  echo " * version: $scriptversion "
  echo " * projectname: $projectname "
  echo " * workingpath: $workingpath "
  echo ""
}

cd "$workingpath"


_update_gfx_kra_work()
{
  krafile=$1
  cd "$workingpath"
  kra_tmpfolder=$(echo $krafile|sed 's/\(.*\)\..\+/\1/')""
  jpgfile=$(echo $krafile|sed 's/\(.*\)\..\+/\1/')".jpg"
  pngfile=$(echo $krafile|sed 's/\(.*\)\..\+/\1/')".png"
  
  echo "${Green} ==> [kra] $krafile quick extract! ${Off}"

  # Create a tmp folder for unzipping
  mkdir -p /tmp/"$kra_tmpfolder"
  # Unzipping the target file
  unzip -j "$workingpath"/"$krafile" "mergedimage.png" -d /tmp/"$kra_tmpfolder"
  # Cleanup PNG without Alpha, compressed to max, and a sRGB colorspace.
  convert /tmp/"$kra_tmpfolder"/"mergedimage.png" -colorspace sRGB -background white -alpha remove -define png:compression-strategy=3  -define png:compression-level=9  "$workingpath"/"$pngfile"
  # Job done, remove the tmp folder.
  rm -rf /tmp/"$kra_tmpfolder"
}

_update_gfx()
{
  # Method to update change in graphical file
  # Trying to be smart and consume the less power, but more disk space.
  # Only file changed are reprocessed thanks to the folder cache

  echo "${Yellow} [GFX]${Off}"
  echo "${Yellow} =-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= ${Off}"
  
  # Project should contain *.kra artworks anyway
  cd "$workingpath"
  export -f _update_gfx_kra_work
  ls -1 *.kra | parallel _update_gfx_kra_work "{}"
}

# Runtime counter: start
renderfarm_runtime_start=$(date +"%s")

# Execute
_display_ui
_update_gfx

# Runtime counter: end and math
renderfarm_runtime_end=$(date +"%s")
diff_runtime=$(($renderfarm_runtime_end-$renderfarm_runtime_start))

# End User Interface messages
echo ""
echo " * $projectname rendered in $(($diff_runtime / 60))min $(($diff_runtime % 60))sec."
echo ""

# Windows title
printf "\033]0;%s\007\n" "Quick-extract: $projectname"

# Task is executed inside a terminal
# This line prevent terminal windows to be closed
# Necessary to read log later
echo -n " Press [Enter] to exit"
read end
