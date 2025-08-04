#!/bin/bash

# 添加源
echo "src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git;main" >> "feeds.conf.default"
echo 'src-git amlogic https://github.com/ophub/luci-app-amlogic.git;main' >> "feeds.conf.default"
