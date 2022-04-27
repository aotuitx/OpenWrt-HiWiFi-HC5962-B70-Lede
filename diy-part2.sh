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
# 设置 DNS 解析端口
sed -i '/dnsmasq/aoption port 53'  package/network/services/dnsmasq/files/dhcp.conf
# 禁止解析 IPv6 DNS 记录
sed -i '/dnsmasq/aoption filter_aaaa 1'  package/network/services/dnsmasq/files/dhcp.conf
#不记录日志
sed -i '/dnsmasq/aoption quietdhcp 1' package/network/services/dnsmasq/files/dhcp.conf
#DHCP顺序分配 IP /etc/config/dhcp 中 config dnsmasq 字段下。
sed -i '/dnsmasq/aoption sequential_ip 1' package/network/services/dnsmasq/files/dhcp.conf
# 禁用内置的 IPv6 管理， /etc/config/network 中 config interface 'wan'、config interface 'lan' 字段下
sed "/proto='none'/aset network.\$1.delegate='0'"  package/base-files/files/bin/config_generate
#禁用 Smare DNS IPV6 服务器，安装 luci-app-smartdns时有效
#sed -i 's/ipv6_server = 1/ipv6_server = 0/g' feeds/kenzo/luci-app-smartdns/luasrc/controller/smartdns.lua

#禁用WAN6生成
#sed -i 's/network_find_wan6/# network_find_wan6/g' package/base-files/files/lib/functions/network.sh
#修改接口
#sed -i 's/ucidef_set_interfaces_lan_wan "lan1 lan2 lan3" "wan"/ucidef_set_interfaces_lan_wan "lan1 lan2 lan3 lan4" "wan"/g' target/linux/ramips/mt7621/base-files/etc/board.d/02_network
#修改网卡接口名称
#sed -i 's/port@1/port@0/g' target/linux/ramips/dts/mt7621_hiwifi_hc5962.dts
#sed -i 's/port@2/port@1/g' target/linux/ramips/dts/mt7621_hiwifi_hc5962.dts
#sed -i 's/port@3/port@2/g' target/linux/ramips/dts/mt7621_hiwifi_hc5962.dts
#sed -i 's/port@4/port@3/g' target/linux/ramips/dts/mt7621_hiwifi_hc5962.dts
#不会什么正规则，用的笨办法。
#定位到'ports {'在下一行加入三个制表符'\ \t'\\t\\t，减少或增加一个'\\t'
#sed -i '/ports {/a\ \t\\t\\tport@0 {' target/linux/ramips/dts/mt7621_hiwifi_hc5962.dts
#sed -i '/port@0 {/a\ \t\\t\\t\\tstatus = "okay0";' target/linux/ramips/dts/mt7621_hiwifi_hc5962.dts
#sed -i '/status = "okay0";/a\ \t\\t\\t\\tlabel = "lan01";' target/linux/ramips/dts/mt7621_hiwifi_hc5962.dts
#sed -i '/label = "lan01";/a\ \t\\t\\t\};0' target/linux/ramips/dts/mt7621_hiwifi_hc5962.dts
#在下一行加入空白行'/a\n'
#sed -i '/};0/a\n' target/linux/ramips/dts/mt7621_hiwifi_hc5962.dts
#sed -i 's/};0/};/g' target/linux/ramips/dts/mt7621_hiwifi_hc5962.dts
#sed -i 's/"lan01"/"lan1"/g' target/linux/ramips/dts/mt7621_hiwifi_hc5962.dts
#sed -i 's/"okay0"/"okay"/g' target/linux/ramips/dts/mt7621_hiwifi_hc5962.dts

# 修改插件名字（修改名字后不知道会不会对插件功能有影响，自己多测试）
#chmod -R 755 package/lean/default-settings/po/zh-cn/more.po
sed -i 's/"带宽监控"/"监控"/g' package/lean/default-settings/po/zh-cn/more.po
sed -i 's/"带宽监控"/"监控"/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po
#sed -i 's/"网络存储"/"存储"/g' package/lean/luci-app-amule/po/zh-cn/amule.po
#sed -i 's/"网络存储"/"存储"/g' package/lean/luci-app-vsftpd/po/zh-cn/vsftpd.po
echo ''  >> feeds/luci/modules/luci-base/po/zh-cn/base.po
echo 'msgid "NAS"'  >> feeds/luci/modules/luci-base/po/zh-cn/base.po
echo 'msgstr "存储"'  >> feeds/luci/modules/luci-base/po/zh-cn/base.po
#echo 'msgstr "存储"'  >> package/lean/default-settings/po/zh-cn/more.po
sed -i 's/"网络存储"/"存储"/g' feeds/luci/applications/luci-app-usb-printer/po/zh-cn/usb-printer.po
#sed -i 's/"实时流量监测"/"流量"/g' package/lean/luci-app-wrtbwmon/po/zh-cn/wrtbwmon.po
#sed -i 's/cbi("qbittorrent"),_("qBittorrent")/cbi("qbittorrent"),_("BT下载")/g' package/lean/luci-app-qbittorrent/luasrc/controller/qbittorrent.lua
#sed -i 's/"aMule设置"/"电驴下载"/g' package/lean/luci-app-amule/po/zh-cn/amule.po
#sed -i 's/"KMS 服务器"/"KMS激活"/g' package/lean/luci-app-vlmcsd/po/zh-cn/vlmcsd.zh-cn.po
#sed -i 's/"USB 打印服务器"/"打印服务"/g' package/lean/luci-app-usb-printer/po/zh-cn/usb-printer.po
#sed -i 's/"Web 管理"/"Web"/g' package/lean/luci-app-webadmin/po/zh-cn/webadmin.po
#sed -i 's/"管理权"/"改密码"/g' feeds/luci/modules/luci-base/po/zh-cn/base.po
#sed -i 's/"服务"/"应用"/g' feeds/luci/applications/luci-app-nft-qos/po/zh-cn/nft-qos.po
#sed -i 's/"服务"/"应用"/g' feeds/luci/applications/luci-app-openvpn/po/zh-cn/openvpn.po
#sed -i 's/"服务"/"应用"/g' feeds/luci/applications/luci-app-qos/po/zh-cn/qos.po
sed -i 's/"服务"/"应用"/g' feeds/luci/modules/luci-base/po/zh-cn/base.po
# 微信推送 英文名换成中文名
sed -i 's/translate("ServerChan")/translate("微信推送：")/g' feeds/kenzo/luci-app-serverchan/luasrc/model/cbi/serverchan/setting.lua
sed -i 's/>serverchan/>微信推送：/g' feeds/kenzo/luci-app-serverchan/luasrc/view/serverchan/serverchan_status.htm
sed -i 's/translate("ServerChan")/translate("微信推送：")/g' feeds/luci/applications/luci-app-serverchan/luasrc/model/cbi/serverchan/setting.lua
sed -i 's/>serverchan/>微信推送：/g' feeds/luci/applications/luci-app-serverchan/luasrc/view/serverchan/serverchan_status.htm
# 删除微信推送部分IP识别。
sed -i '1,4d' feeds/kenzo/luci-app-serverchan/root/usr/bin/serverchan/api/ipv4.list
sed -i '1,4d' feeds/luci/applications/luci-app-serverchan/root/usr/bin/serverchan/api/ipv4.list

# 修改应用过滤位置
sed -i 's/"network"/"services"/g' feeds/OpenAppFilter/luci-app-oaf/luasrc/controller/appfilter.lua
sed -i 's/"network"/"services"/g' feeds/OpenAppFilter/luci-app-oaf/luasrc/model/cbi/appfilter/dev_status.lua

#更改 AdGuard Home 配置文件位置
sed -i 's/etc\/AdGuardHome.yaml/etc\/config\/AdGuardHome.yaml/g' feeds/kenzo/luci-app-adguardhome/root/etc/config/AdGuardHome
sed -i 's/etc\/AdGuardHome.yaml/etc\/config\/AdGuardHome.yaml/g' feeds/kenzo/luci-app-adguardhome/root/etc/init.d/AdGuardHome
sed -i 's/none/redirect/g' feeds/kenzo/luci-app-adguardhome/root/etc/config/AdGuardHome
sed -i 's/var\/adguardhome/etc\/AdGuardHome/g' package/feeds/packages/adguardhome/files/adguardhome.config
sed -i 's/etc\/adguardhome.yaml/etc\/config\/AdGuardHome.yaml/g' package/feeds/packages/adguardhome/files/adguardhome.init
sed -i 's/var\/adguardhome/etc\/AdGuardHome/g' feeds/kenzo/adguardhome/files/adguardhome.config
sed -i 's/etc\/adguardhome.yaml/etc\/config\/AdGuardHome.yaml/g' feeds/kenzo/adguardhome/files/adguardhome.init
#更改 AdGuard Home 打开 Web 端口
sed -i 's/3000/8080/g' feeds/kenzo/luci-app-adguardhome/root/etc/config/AdGuardHome
sed -i 's/3000/8080/g' feeds/kenzo/luci-app-adguardhome/root/usr/share/AdGuardHome/AdGuardHome_template.yaml


#关闭自建私有源签名验证
#sed -i '90d' package/system/opkg/Makefile

#自动共享
sed -i 's/a.default = "0"/a.default = "1"/g' ./feeds/luci/applications/luci-app-cifsd/luasrc/controller/cifsd.lua

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

# 添加核心温度的显示
#sed -i 's|pcdata(boardinfo.system or "?")|luci.sys.exec("uname -m") or "?"|g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
#sed -i 's/or "1"%>/or "1"%> ( <%=luci.sys.exec("expr `cat \/sys\/class\/thermal\/thermal_zone0\/temp` \/ 1000") or "?"%> \&#8451; ) /g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm

