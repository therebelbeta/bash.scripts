#! /usr/bin/env bash
cd ~/git/rain
mv nrf-com/ nrf-old/nrf-com-old-$(date +%Y%m%d-%H%M%S); 
git clone https://github.com/mediarain/nrf-com
cd nrf-com/docroot/
chmod a+w sites/default
mkdir sites/default/files
chmod a+w sites/default/files
cp sites/default/default.settings.php sites/default/settings.php
chmod a+w sites/default/settings.php
cd sites/all/themes/nrf/
git hf init