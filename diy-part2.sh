# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)

# Modify default IP
#sed -i 's/192.168.1.1/192.168.1.2/g' package/base-files/files/bin/config_generate

# Diy
sed -i "s/KERNEL_PATCHVER:=*.*/KERNEL_PATCHVER:=5.19/g" target/linux/x86/Makefile
sed -i "s/KERNEL_TESTING_PATCHVER:=*.*/KERNEL_TESTING_PATCHVER:=5.19/g" target/linux/x86/Makefile
sed -i "s/hostname='*.*'/hostname='OpenWrt'/" package/base-files/files/bin/config_generate
sed -i "s/DISTRIB_ID='*.*'/DISTRIB_ID='OpenWrt'/g" package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='OpenWrt'/g"  package/base-files/files/etc/openwrt_release
sed -i 's/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/root::0:0:99999:7:::/g' package/lean/default-settings/files/zzz-default-settings
sed -i '/(<%=pcdata(ver.luciversion)%>)/a\      built by ywt114' package/lean/autocore/files/x86/index.htm
echo "$(date +'%m.%d.%Y')" > package/base-files/files/etc/openwrt_version
curl -fsSL  https://raw.githubusercontent.com/ywt114/poweroff/main/poweroff.htm > feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
curl -fsSL  https://raw.githubusercontent.com/ywt114/poweroff/main/system.lua > feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua

cd package/lean
git clone https://github.com/fw876/helloworld
git clone https://github.com/vernesong/OpenClash
git clone https://github.com/xiaorouji/openwrt-passwall
git clone https://github.com/kenzok8/openwrt-packages
mv openwrt-packages/luci-app-passwall/ ./openwrt-passwall/
mv openwrt-packages/luci-app-eqos/ ./
mv openwrt-packages/luci-app-store/ ./
mv openwrt-packages/luci-lib-taskd/ ./
mv openwrt-packages/luci-lib-xterm/ ./
mv openwrt-packages/taskd/ ./
rm -rf openwrt-packages/
git clone https://github.com/Lienol/openwrt-package
mv openwrt-package/luci-app-socat/ ./
rm -rf openwrt-package/
git clone https://github.com/sbwml/luci-app-alist
