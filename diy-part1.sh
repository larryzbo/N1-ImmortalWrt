# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki' >>feeds.conf.default
echo 'src-git amlogic https://github.com/ophub/luci-app-amlogic.git' >>feeds.conf.default
