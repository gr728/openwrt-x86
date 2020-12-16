#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.20.5/g' package/base-files/files/bin/config_generate
echo '添加登录密码密文'
sed -i 's/root::0:0:99999:7:::/root:$1$FHLZsCKT$LvLemPCPOEofaV5pyBWhP0:0:0:99999:7:::/g'  package/base-files/files/etc/shadow

echo '修改时区'
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate
# '修改baidupcs-web'
sed -i 's/PKG_ARCH_BAIDUPCS-WEB:=86/PKG_ARCH_BAIDUPCS-WEB:=386/g' package/lean/baidupcs-web/Makefile
