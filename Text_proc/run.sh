#!/bin/bash
orange=`tput setaf 11`
bg_orange=`tput setab 178`
purple=`tput setaf 13`
Line=`tput smul`
bold=`tput bold`
black=`tput setaf 0`
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
white=`tput setaf 15`
reset=`tput sgr0`
bg_red=`tput setab 1`
bg_green=`tput setab 2`
bg_white=`tput setab 7`
bg_blue=`tput setab 4`
lightblue=`tput setaf 45`
lightgreen=`tput setaf 46`
bleuetern=`tput setaf 45`
ilghtpurple=`tput setaf 33`
lightred=`tput setaf 161`
darkblue=`tput setaf 19`
dir=$(
cd -P -- "$(dirname -- "$0")" && pwd -P
)
cd "$dir" 2>&1 &>/dev/null

echo "${bg_red}${white}---> Enter the Machine name of the layer in low cap eg. idc_hd.                  <---${reset}"
read -p "${white}MachineNameMap             : ${orange}" MachineNameMap
echo "$MachineNameMap"

echo "${bg_red}${white}---> Enter the HumanReadable_Name of the layer eg. Plans I.G.C Edition 1988.     <---${reset}"
read -p "${white}HumanReadable_Name             : ${orange}" HumanReadable_Name
echo "$HumanReadable_Name"

echo "${bg_red}${white}---> Enter the Wokspace:LayerName of the layer eg. IDC:25-50.                    <---${reset}"
read -p "${white}Wokspace:LayerName             : ${orange}" WokspaceLayerName
echo "$WokspaceLayerName"

echo "${bg_red}${white}---> Enter the SetMapCenter of the layer EPSG:3857 eg. IDC:25-50                 <---${reset}"
read -p "${white}Long,Lat             : ${orange}" SetMapCenter
echo "$SetMapCenter"

echo "${bg_red}${white}---> Enter the SetZoomLevel of the layer eg. 17                                  <---${reset}"
read -p "${white}SetZoomLevel             : ${orange}" SetZoomLevel
echo "$SetZoomLevel"

cat model.txt | sed "s/MachineNameMap/$MachineNameMap/g" | sed "s/HumanReadable_Name/$HumanReadable_Name/g" | sed "s/WokspaceLayerName/$WokspaceLayerName/g" | sed "s/SetMapCenter/$SetMapCenter/g" | sed "s/SetZoomLevel/$SetZoomLevel/g" > ../"$MachineNameMap".js

echo "${white}---> Declare the JS in template"
echo -e "
${green}    drupal_add_js(drupal_get_path('theme', 'cdm') .'/js/production/add_layers/TMS/$MachineNameMap.js');"
echo "
${white}---> Declare the main div of the layer"
echo -e "
${green}           <div class=\"list-group-item add-layer\" id=\"add_$MachineNameMap\">$HumanReadable_Name</div>"

cd - 2>&1 &>/dev/null


#MachineNameMap
#HumanReadable_Name
#WokspaceLayerName
#SteMapCenter
#
#<div class="list-group-item add-layer" id="add_assemblage_idc"> Assemblage - I.D.C 1088</div>
#drupal_add_js(drupal_get_path('theme', 'cdm') .'/js/production/add_layers/TMS/DeptDeLaSeineHaussmann1866.js');
