#!/bin/bash
# https://mybinder.readthedocs.io/en/latest/config_files.html#postbuild-run-code-after-installing-the-environment
# http://mirror.kumi.systems/ctan/macros/latex/contrib/webquiz/doc/webquiz.pdf
echo "running postBuild"
set -ex

#TARGET=$(kpsewhich -var-value TEXMFLOCAL)
cd /tmp
wget -q http://mirrors.ctan.org/macros/latex/contrib/webquiz.zip
unzip webquiz.zip
rm webquiz.zip
cd webquiz
./scripts/webquiz --tex-install
#mktexlsr
