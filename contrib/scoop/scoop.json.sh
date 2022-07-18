#!/bin/bash
set -euo pipefail

# Params:
# $1: Path to the Cargo crate, optional
# $2: Directory of the Scoop manifests, if empty outputs file to stdout

{
    read -r VERSION;
    read -r DESCRIPTION;
    read -r NAME;
    read -r LICENSE;
    read -r REPO;
} <<< "$(cargo read-manifest ${1:+--manifest-path "$1/Cargo.toml"} | jq -r "\
    .version,
    .description,
    .name,
    .license,
    .repository
")"

TAG="v$VERSION"
URL64="$REPO/releases/download/$TAG/$NAME-x86_64-pc-windows-msvc-$TAG.zip"
URL32="$REPO/releases/download/$TAG/$NAME-i686-pc-windows-msvc-$TAG.zip"

HASH64=$(curl -L "$URL64" | openssl dgst -sha256 -r | awk '{print $1}')
HASH32=$(curl -L "$URL32" | openssl dgst -sha256 -r | awk '{print $1}')

cat > "${2:-/dev/stdout}" <<EOF
{
    "version": "$VERSION",
    "description": "$DESCRIPTION",
    "homepage": "${HOMEPAGE:-https://fzyzcjy.github.io/flutter_rust_bridge/}",
    "license": "$LICENSE",
    "architecture": {
        "64bit": {
            "url": "$URL64",
            "hash": "$HASH64"
        },
        "32bit": {
            "url": "$URL32",
            "hash": "$HASH32"
        }
    },
    "bin": "$NAME.exe",
    "checkver": {
        "github": "$REPO"
    },
    "autoupdate": {
        "architecture": {
            "64bit": {
                "url": "$REPO/releases/download/v\$version/$NAME-x86_64-pc-windows-msvc-v\$version.zip",
                "hash": {
                    "url": "\$baseurl/hashes-v\$version.txt"
                }
            },
            "32bit": {
                "url": "$REPO/releases/download/v\$version/$NAME-i686-pc-windows-msvc-v\$version.zip",
                "hash": {
                    "url": "\$baseurl/hashes-v\$version.txt"
                }
            }
        }
    }
}
EOF