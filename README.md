![](images/titles.jpg)
# Personal tool for performing automated Vms Backups

    First thing first, you need to clone this repository to your backup server.

## Step 1 : Installing ovftool on the backup Server
    
    You now need to install ovftool on that backup Server.

## Step 2 : Adding the ip address of the Hypervisor :
    
    Delete everything in the file "Hypervisor_IP_address.txt".

    After that, add only the IP address of the hypervisor.
## Step 3 : Adding the Names of your vms to the files "Machines_names.txt"
     
    Be sure to add the names of your vms to the file "Machines_names.txt" present in this repository.

    Please make sure that the VMs names have no space in it because the script won't work.


#### Examples of What won't work : :
>Windows server AD # This won't work

>Linux FTP Server  # This also won't work




#### Examples of What will work ::
>Windows_server_AD # This will work

>Linux_FTP_Server  # This will work
---
## This is the End

![end](images/end.jpg)