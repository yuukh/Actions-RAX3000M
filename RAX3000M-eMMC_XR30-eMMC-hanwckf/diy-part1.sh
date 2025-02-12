#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#git clone https://github.com/messense/aliyundrive-webdav package/messense
git clone https://github.com/destan19/OpenAppFilter package/OpenAppFilter

mkdir MyConfig
pushd MyConfig
git clone --depth=1 https://github.com/Siriling/OpenWRT-MyConfig .
popd

# 设置GCC版本
cp -rf MyConfig/configs/hanwckf/toolchain/* toolchain

#解决elfutils编译错误
# rm -rf package/libs/elfutils
cp -rf MyConfig/configs/hanwckf/package/libs package

# 更新uhttpd版本（防止在GCC版本为13.3.0时报错）
# rm -rf package/network/services/uhttpd
# cp -rf MyConfig/configs/hanwckf/package/network package
