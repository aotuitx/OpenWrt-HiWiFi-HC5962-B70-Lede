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

# 修改默认IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate
sed -i 's/192.168/10.0/g' package/base-files/files/bin/config_generate
#禁用IPv6 DHCP，包含单引号的sed外部直接用双引号
sed -i "s/ipv6='1'/ipv6='0'/g" package/base-files/files/bin/config_generate
#禁用WAN6生成
sed -i 's/network_find_wan6/# network_find_wan6/g' package/base-files/files/lib/functions/network.sh


#设置文件权限
chmod -R 755 files/usr/bin/AdGuardHome
chmod -R 755 files/usr/bin/dnsproxy
chmod -R 755 files/usr/bin/kcptun-client
chmod -R 755 files/usr/bin/trojan-go
chmod -R 755 files/usr/bin/v2ray-plugin
chmod -R 755 files/usr/bin/xray

#echo '修改文件'
#rm -rf package/base-files/files/etc/banner
#cp -f ../banner package/base-files/files/etc/
