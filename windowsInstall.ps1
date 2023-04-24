# Uninstall old config
#Remove-Item -Recurse -Force $home\AppData\Local\nvim-data
Remove-Item -Recurse -Force $home\AppData\Local\nvim

# Install the new config
New-Item -itemType Directory $home\AppData\Local\nvim
Copy-Item init.lua $home\AppData\Local\nvim
