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
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

echo "" >> package/base-files/files/etc/sysctl.d/10-default.conf
echo "net.ipv4.neigh.default.gc_thresh1 = 512"  >> package/base-files/files/etc/sysctl.d/10-default.conf
echo "net.ipv4.neigh.default.gc_thresh2 = 2048" >> package/base-files/files/etc/sysctl.d/10-default.conf
echo "net.ipv4.neigh.default.gc_thresh3 = 4096" >> package/base-files/files/etc/sysctl.d/10-default.conf

#echo "" >> package/base-files/files/etc/netdata/netdata.conf
#echo "[plugin:proc]" >> package/base-files/files/etc/netdata/netdata.conf
#echo -e "\tipc = no" >> package/base-files/files/etc/netdata/netdata.conf

for X in $(ls -1 target/linux/x86 | grep "config-"); 
do
echo "CONFIG_64BIT=y" >> target/linux/x86/${X};
echo "CONFIG_DRM=y" >> target/linux/x86/${X};
echo "CONFIG_DRM_I915=y" >> target/linux/x86/${X};
echo "CONFIG_DRM_I915_GVT=y" >> target/linux/x86/${X};
echo "CONFIG_DUMMY_CONSOLE=y" >> target/linux/x86/${X};
done
