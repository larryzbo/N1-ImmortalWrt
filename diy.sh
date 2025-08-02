#!/bin/bash

# Add packages
rm -rf package/luci-app-amlogic
git clone https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic

# Update packages
cp -rf clone/amlogic/luci-app-amlogic 

# Clean packages
rm -rf clone
