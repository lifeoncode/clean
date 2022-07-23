#!/bin/bash

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
echo "complete.."
