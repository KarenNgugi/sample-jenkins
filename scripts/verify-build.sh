#!/usr/bin/env bash
set -euo pipefail

echo "Starting verification script"

if [[ ! -f app/version.txt ]]; then
  echo "ERROR: app/version.txt not found"
  exit 1
fi

VERSION=$(cat app/version.txt)

if [[ -z "$VERSION" ]]; then
  echo "ERROR: version file is empty"
  exit 1
fi

mkdir -p output

echo "Application version: $VERSION" > output/build-report.txt
echo "Verified at: $(date)" >> output/build-report.txt
echo "Build verification complete"
