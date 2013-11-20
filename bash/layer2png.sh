#!/bin/bash
echo "converting PSDs..."
for i in *psd
do
    name=${i%.psd}
    echo "Coverting $name.psd"
    convert "$name.psd" -scale 100% "$name.png"
done
echo -e "conversion complete. \n"