#!/bin/bash

echo ""
echo "Cleaning filesystem..."
echo ""
# folders not to be wiped
folders=( Desktop Documents Downloads Music Pictures Videos )

# first clean all the folders
for i in "${folders[@]}"
do
	rm -rf $i/*
done

# then remove everything that wasn't initially at HOME
shopt -s extglob
for x in "${folders[@]}"
do
	rm -rf -- !(Desktop|Documents|Downloads|Music|Pictures|Videos|.*|*.sh)
done

sleep 3
echo "Filesystem clean complete..."
echo ""

echo "Removing unused packages..."
echo "wtc" | sudo -S apt autoremove -y
echo "wtc" | -S apt autoclean
sleep 3

echo ""
echo "Done."
echo ""

echo "Updating system packages in use..."
sleep 3
echo "wtc" | sudo -S apt update
echo "wtc" | sudo -S apt upgrade -y
echo "wtc" | sudo -S apt install openssh-server -y
echo "wtc" | sudo -S apt install expect -y

sleep 3
echo ""
echo "System clean and up to date. - READY"
