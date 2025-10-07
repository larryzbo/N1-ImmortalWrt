#!/bin/bash

#添加feeds源
echo "src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git;main" >> feeds.conf.default
echo "src-git openclash https://github.com/vernesong/Op
enClash.git;main" >> feeds.conf.default
echo "src-git openclash https://github.com/xiaorouji/openwrt-passwall.git;main" >> feeds.conf.default


# Update packages
rm -rf feeds/luci/applications/luci-app-passwall
cp -rf clone/amlogic/luci-app-amlogic clone/passwall/luci-app-passwall feeds/luci/applications/

# Clean packages
rm -rf clone
