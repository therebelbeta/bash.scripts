#!/bin/bash
echo "converting PDFs..."
for i in *pdf
do
    name=${i%.pdf}
    echo "Coverting $name.pdf"
    convert -density 96 -quality 85 "$name.pdf" "$name.png"
done
echo -e "conversion complete. \n"