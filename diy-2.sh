#!/bin/bash

# Add packages
git clone https://github.com/ophub/luci-app-amlogic --depth=1 clone/amlogic

# Update packages
cp -rf clone/amlogic/luci-app-amlogic  feeds/luci/applications/

# Clean packages
rm -rf clone

./scripts/feeds update -a
./scripts/feeds install -a
