#!/bin/sh
VERSION=`echo "$1" | cut -c2-`
SIGNATURE_LINUX_FILE_DIR=$2

# restored from github artifacts
SIGNATURE_LINUX=`cat ${SIGNATURE_LINUX_FILE_DIR}/remembrancer_*_amd64.AppImage.tar.gz.sig`
# FIXME add Mac and Windows
DATE=`date -u '+%Y-%m-%dT%H:%M:%SZ'`

tee update.json <<EOF
{
  "version": "${VERSION}",
  "notes": "n/a",
  "pub_date": "${DATE}",
  "platforms": {
    "darwin-x86_64": {
      "signature": "",
      "url": "https://github.com/dArignac/remembrancer/releases/download/v${VERSION}/remembrancer.app.tar.gz"
    },
    "linux-x86_64": {
      "signature": "${SIGNATRUE_LINUX}",
      "url": "https://github.com/dArignac/remembrancer/releases/download/v${VERSION}/remembrancer_${VERSION}_amd64.AppImage.tar.gz"
    },
    "windows-x86_64": {
      "signature": "",
      "url": "https://github.com/dArignac/remembrancer/releases/download/v${VERSION}/remembrancer_${VERSION}_x64_en-US.msi.zip"
    }
  }
}
EOF