#!/bin/bash

chmod -R 777 inception data

vmhgfs-fuse .host:/inception inception -o subtype=vmhgfs-fuse,allow_other
