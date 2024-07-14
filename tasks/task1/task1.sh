#!/bin/bash
#source="/home/noman/work/work1"
#destination="/home/noman/Linux/task1"

read -p "Enter the source directory: " source
read -p "Enter the destination directory: " destination

cp -r "$source" "$destination"
archiveName="work1.tar.gz"
archiveFolder="work1"

echo "Press 1 to archive or any other key to continue"
read option
if [ "$option" = 1 ]; then
    tar -czf "$destination/$archiveName" -C "$destination" "$archiveFolder"
else
    echo "Archive not created."
fi
