#!/bin/bash

# 添加包
git clone https://github.com/ophub/luci-app-amlogic --depth=1 clone/amlogic

# 升级包
cp -rf clone/amlogic/luci-app-amlogic  feeds/luci/applications/

# 清理包
rm -rf clone
