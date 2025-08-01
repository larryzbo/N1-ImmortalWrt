#!/bin/bash

# Add packages
git clone https://github.com/ophub/luci-app-amlogic --depth=1 clone/amlogic
git clone https://github.com/nikkinikki-org/OpenWrt-nikki --depth=1 clone/nikki

# Update packages
rm -rf feeds/luci/applications/luci-app-passwall
cp -rf clone/amlogic/luci-app-amlogic clone/nikki/luci-app-nikki feeds/luci/applications/

# Clean packages
rm -rf clone
