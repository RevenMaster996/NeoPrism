#! /bin/bash

echo "Removing old nvim config"
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim

echo "Create config folder"
mkdir -p ~/.config/nvim

echo "Copy new configs"
cp -f init.lua ~/.config/nvim

echo
echo "Done!"
