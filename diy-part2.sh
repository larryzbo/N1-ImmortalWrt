#!/bin/bash
cd openwrt

# 步骤1：生成默认配置
make defconfig

# 步骤2：自定义配置（示例）
# 启用 LUCI 界面
./scripts/feeds install -a
./scripts/feeds update -a
echo "CONFIG_PACKAGE_luci=y" >> .config

# 添加其他配置（替换为你的需求）
echo "CONFIG_PACKAGE_openssh-server=y" >> .config
echo "CONFIG_PACKAGE_vim-full=y" >> .config

# 步骤3：验证并生成最终配置
make defconfig
