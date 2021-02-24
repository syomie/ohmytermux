#!/data/data/com.termux/files/usr/bin/bash
#######################################################
#   
#   文件名称：generate.sh
#   创 建 者：Syomie
#   创建日期：2021年02月23日
#   描    述：用于快速将项目打包成deb文件。
#
#######################################################
set -e
command -v dpkg > /dev/null

TOP="$(dirname $0)"
PACKAGEDIR="${TOP}/package"
PUTOUT="${TOP}/build"
if [[ ! -d $PUTOUT ]];then
    mkdir $PUTOUT
fi
chmod 755 "${PACKAGEDIR}/DEBIAN"
chmod 555 "${PACKAGEDIR}/DEBIAN/postinst"
echo "准备生成deb包……"
dpkg -b "$PACKAGEDIR" "${PUTOUT}"
