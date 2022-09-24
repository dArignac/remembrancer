#!/bin/sh
VERSION=`echo "$1" | cut -c2-`
PREVIOUS_VERSION=`echo "$2" | cut -c2-`
TARGET=$3
SIGNATURE_FILE_DIR=$4
# restored from github artifacts
SIGNATURE=`cat ${SIGNATURE_FILE_DIR}/remembrancer_*_amd64.AppImage.tar.gz.sig`
DATE=`date -u '+%Y-%m-%dT%H:%M:%SZ'`
DIR="_site/${TARGET}/v${PREVIOUS_VERSION}"
# the previous version will call that path/url with its version number
# Note: "v" is included here as we upload in the workflow with the git ref as value with has the "v" in it, e.g. v1.2.3
FILE="${DIR}/update.json"

echo "Creating update file for version ${PREVIOUS_VERSION} on Github pages for target ${TARGET} and new version ${VERSION}"

mkdir -p ${DIR}
cp update.tmpl.json ${FILE}

sed -i 's/"version": "",/"version": "'"${VERSION}"'",/g' ${FILE}
sed -i 's/download\/v.*\/remembrancer/download\/v'"${VERSION}"'\/remembrancer/g' ${FILE}
sed -i 's/remembrancer_\([0-9]\+\.[0-9]\+\.[0-9]\+\)/remembrancer_'"${VERSION}"'/g' ${FILE}
sed -i 's/"pub_date": "",/"pub_date": "'"${DATE}"'",/' ${FILE}
sed -i 's/"signature": ""/"signature": "'"${SIGNATURE}"'"/' ${FILE}

echo "Created update file ${FILE}:"
cat ${FILE}
