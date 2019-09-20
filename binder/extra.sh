#!/bin/bash
# https://mybinder.readthedocs.io/en/latest/config_files.html#postbuild-run-code-after-installing-the-environment
echo "running postBuild"
set -ex

TARGET=$(kpsewhich -var-value TEXMFLOCAL)
mkdir -p "$TARGET"
cd "$TARGET"
wget http://mirrors.ctan.org/macros/latex/contrib/webquiz.zip
unzip webquiz.zip
rm webquiz.zip
mktexlsr
