#!/bin/sh
VERSION=$1
TARGET=$2
SIGNATURE=`cat src-tauri/target/release/bundle/appimage/remembrancer_*_amd64.AppImage.tar.gz.sig`
DATE=`date -u '+%Y-%m-%dT%H:%M:%SZ'`
DIR="./updates/${TARGET}"
FILE="${DIR}/${VERSION}.json"

echo "Creating update file on Github pages for target ${TARGET} and version ${VERSION}"

mkdir -p ${DIR}
cp update.tmpl.json ${FILE}

sed -i 's/"version": "",/"version": "'"${VERSION}"'",/g' ${FILE}
sed -i 's/download\/v.*\/remembrancer/download\/v'"${VERSION}"'\/remembrancer/g' ${FILE}
sed -i 's/remembrancer_\([0-9]\+\.[0-9]\+\.[0-9]\+\)/remembrancer_'"${VERSION}"'/g' ${FILE}
sed -i 's/"pub_date": "",/"pub_date": "'"${DATE}"'",/' ${FILE}
sed -i 's/"signature": ""/"signature": "'"${SIGNATURE}"'"/' ${FILE}
