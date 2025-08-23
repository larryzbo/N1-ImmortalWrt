#!/bin/bash
set -euo pipefail

TOPDIR="$(pwd)"
FEEDS_DIR="$TOPDIR/feeds"
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

mkdir -p "$FEEDS_DIR/luci/applications" "$FEEDS_DIR/packages/utils"

# 添加包列表(仓库 URL, 子目录, 目标路径)
# luci/applications/xxx（LuCI）
# packages/utils/xxx（工具类包）
# packages/net/xxx（网络类包）
# packages/system/xxx（系统类包）
# packages/libs/xxx（库）
# packages/kernel/xxx（内核模块）
PACKAGES=(
  # luci-app-amlogic
  "https://github.com/ophub/luci-app-amlogic luci-app-amlogic luci/applications/luci-app-amlogic"

  # OpenWrt-nikki
  "https://github.com/nikkinikki-org/OpenWrt-nikki nikki packages/utils/nikki"
  "https://github.com/nikkinikki-org/OpenWrt-nikki luci-app-nikki luci/applications/luci-app-nikki"

)

for entry in "${PACKAGES[@]}"; do
  set -- $entry
  repo=$1
  subdir=$2
  target=$3

  echo "==> 处理包: $repo ($subdir -> $target)"

  # 克隆仓库
  workdir="$TMPDIR/$(basename "$repo")"
  if [ ! -d "$workdir" ]; then
    git clone --depth=1 "$repo" "$workdir"
  fi

  # 移动子目录到目标路径
  rm -rf "$FEEDS_DIR/$target"
  mkdir -p "$(dirname "$FEEDS_DIR/$target")"
  mv "$workdir/$subdir" "$FEEDS_DIR/$target"
done

echo "done"
