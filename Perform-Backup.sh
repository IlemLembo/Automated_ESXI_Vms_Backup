#!/bin/bash

cwd=$(pwd)
ls -d /Backup || mkdir /Backup
file="$cwd/Virtual_Machines_names.txt"

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "File not found: $file"
    exit 1
fi

# Read each line from the file
while IFS= read -r line; do
    # Skip lines starting with '#'
    if [[ "$line" == \#* ]]; then
        continue
    fi

    # Extract machine name
    machine_name=$(echo "$line")

    # Perform your operation on the machine name
    # For example, print the machine name
    echo "Starting $machine_name backup..."

    # Creating a folder with the current date
    folder_name="/Backup/$machine_name-$(date +%d-%m-%Y)"
    mkdir -p "$folder_name"


    # Backup the virtual machine
    # echo "vi://root:$(grep password= $cwd/Hypervisor_Infos.txt | cut -d '=' -f 2)@$(grep Hypervisor= $cwd/Hypervisor_Infos.txt | cut -d '=' -f 2)/$machine_name $folder_name/$machine_name-$(date +%d-%m-%Y)$"
    ovftool -o --quiet vi://root:$(grep password= $cwd/Hypervisor_Infos.txt | cut -d '=' -f 2)@$(grep Hypervisor= $cwd/Hypervisor_Infos.txt | cut -d '=' -f 2)/$machine_name  "$folder_name/$machine_name-$(date +$
done < "$file"

echo "All backups completed."