#!/bin/bash


ls -d /Backup || mkdir /Backup
file="Virtual_Machine_names.txt"

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

    # Add your custom operations here
    folder_name="$machine_name-$(date +%d-%m-%Y)"
    mkdir -p "$folder_name"

    ovftool -o --quiet vi://root:$(grep password | cut -d " " -f 2)@$(grep Hypervisor Hypervisor_IP_address.txt | cut -d " " -f 2)/$machine_name "/Backup/$folder_name/" || echo "Backup of $machine_name failed. Check if the machine exists!"

    echo "Backup of $machine_name completed."

done < "$file"

echo "All backups completed."
```