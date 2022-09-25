#!/bin/sh
VERSION=`echo "$1" | cut -c2-`
SIGNATURE_LINUX_FILE_DIR=$2
SIGNATURE_MACOS_FILE_DIR=$3
SIGNATURE_WINDOWS_FILE_DIR=$4

# restored from github artifacts
SIGNATURE_LINUX=`cat ${SIGNATURE_LINUX_FILE_DIR}/remembrancer_*_amd64.AppImage.tar.gz.sig`
SIGNATURE_MACOS=`cat ${SIGNATURE_MACOS_FILE_DIR}/*.app.tar.gz.sig`
SIGNATURE_WINDOWS=`cat ${SIGNATURE_QINDOWS_FILE_DIR}/remembrancer_*_x64_en-US.msi.zip.sig`
DATE=`date -u '+%Y-%m-%dT%H:%M:%SZ'`

tee update.json <<EOF
{
  "version": "${VERSION}",
  "notes": "n/a",
  "pub_date": "${DATE}",
  "platforms": {
    "darwin-x86_64": {
      "signature": "${SIGNATURE_MACOS}",
      "url": "https://github.com/dArignac/remembrancer/releases/download/v${VERSION}/remembrancer.app.tar.gz"
    },
    "linux-x86_64": {
      "signature": "${SIGNATURE_LINUX}",
      "url": "https://github.com/dArignac/remembrancer/releases/download/v${VERSION}/remembrancer_${VERSION}_amd64.AppImage.tar.gz"
    },
    "windows-x86_64": {
      "signature": "${SIGNATURE_WINDOWS}",
      "url": "https://github.com/dArignac/remembrancer/releases/download/v${VERSION}/remembrancer_${VERSION}_x64_en-US.msi.zip"
    }
  }
}
EOF