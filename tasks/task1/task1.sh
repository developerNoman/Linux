#!/bin/bash
read -p "Enter the source path: " source
read -p "Enter the destination path: " destination

cp -r "$source" "$destination"
archiveName="work1.tar.gz"
archiveFolder="work1"
echo "Press 1 to archive or other key to continue"
read option
if [ "$option" = 1 ]; then
    tar -czf "$destination/$archiveName" -C "$destination" "$archiveFolder"
else
    echo "Archive not created."
fi
