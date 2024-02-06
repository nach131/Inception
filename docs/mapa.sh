#!/bin/bash

mkdir srcs data
chmod -R 777 srcs data

vmhgfs-fuse .host:/srcs srcs -o subtype=vmhgfs-fuse,allow_other
vmhgfs-fuse .host:/data data -o subtype=vmhgfs-fuse,allow_other