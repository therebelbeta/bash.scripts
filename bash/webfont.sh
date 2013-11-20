#! /bin/bash

OFILEPREF=${1%%otf}
CLEANNAME=${OFILEPREF%%ttf}

OFILESUFF1=ttf
OFILESUFF2=woff
OFILESUFF3=svg
OFILESUFF4=eot

TTFFILE="$CLEANNAME""$OFILESUFF1"
WOFFFILE="$CLEANNAME""$OFILESUFF2"
SVGFILE="$CLEANNAME""$OFILESUFF3"
EOTFILE="$CLEANNAME""$OFILESUFF4"

fontforge -c '
    Open("'$1'");
    Generate("'$TTFFILE'");
    Generate("'$WOFFFILE'");
    Generate("'$SVGFILE'");
    Quit(0);'

echo "Conversion complete";