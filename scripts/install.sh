# bin/bash
find ./ -type f -iname "*.sh" -exec chmod +x {} \;
sudo apt-get install unzip

./scripts/dl_imprint.sh
./scripts/dl_fundament.sh
./scripts/dl_assets.sh
./scripts/dl_src.sh
./scripts/dl_saxon.sh
./scripts/dl_staticsearch.sh