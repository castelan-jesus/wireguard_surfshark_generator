#Wireguard Surfshark Generator

###A simple way to generate or update Surfshark's WireGuard .conf files with your private key.

##Dependencies
Shoudn't be a problem since most distros includes them out of the box:
* wget
* sed
* tar
* zip

##Usage
Simply clone this repo and run "**bash sf_wg.sh**".

You will be promted to the menu:
1. Download blank .conf files from SurfShark servers, insert your private key and then generate .tar, .tar.gz and .zip (compatible with most routers and official WireGuard apps). Will be saved in \<Path>
2. Update .conf files located in \<Path> to change current private key
3. Only generate .tar, .tar.gz and .zip from files in \<Path> Will be saved in \<Path>


##Notes
* You can specify your own path by editing the "path" file. By default it's "$HOME/WG_Surfshark/conf_files".
* Your private key is not sent to any server. It's just inserted to your .conf files (even if you are offline). However, in order to get you .conf files you must be online.
* **You don't need to re-download your .conf files every time you need to change your private key.** Just place your files in your \<Path> and **select option 2**
* A .tar, .tar.gz and .zip files are also generated (so you can export them to a WireGuard app or a router all at once) 
* This script should work to **update** the private key of any WireGuard .conf file (not only SurfShark)



