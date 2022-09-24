#!/bin/sh
VERSION=$1
DATE=`date -u '+%Y-%m-%dT%H:%M:%SZ'`

sed -i 's/^version = ".*"$/version = "'"${VERSION}"'"/g' src-tauri/Cargo.toml
sed -i 's/^    "version": ".*"$/    "version": "'"${VERSION}"'"/g' src-tauri/tauri.conf.json
sed -i 's/^  "version": ".*",$/  "version": "'"${VERSION}"'",/g' package.json
sed -i 's/^  "version": ".*",$/  "version": "'"${VERSION}"'",/g' package-lock.json
sed -i 's/Version: <span>.*<\/span>/Version: <span>'"${VERSION}"'<\/span>/g' src/lib/Version.svelte
sed -i 's/"version": "v.*",/"version": "v'"${VERSION}"'",/g' updater.json
sed -i 's/download\/v.*\/remembrancer/download\/v'"${VERSION}"'\/remembrancer/g' updater.json
sed -i 's/remembrancer_\([0-9]\+\.[0-9]\+\.[0-9]\+\)/remembrancer_'"${VERSION}"'/g' updater.json
sed -i 's/"pub_date": ".*",/"pub_date": "'"${DATE}"'",/' updater.json
