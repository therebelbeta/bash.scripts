#!/usr/bin/env bash
remote_id=$(
  xinput list |
  sed -n 's/.*Naga.*id=\([0-9]*\).*keyboard.*/\1/p'
)
[ "$remote_id" ] || exit

mkdir -p /tmp/xkb/symbols
cat >/tmp/xkb/symbols/custom <<\EOF
xkb_symbols "remote" {
    key <AE01>   {      [0xffca]       };
    key <AE02>   {      [0xffcb]       };
    key <AE03>   {      [0xffcc]       };
    key <AE04>   {      [0xffcd]       };
    key <AE05>   {      [0xffce]       };
    key <AE06>   {      [0xffcf]       };
    key <AE07>   {      [0xffd0]       };
    key <AE08>   {      [0xffd1]       };
    key <AE09>   {      [0xffd2]       };
    key <AE10>   {      [0xffd3]       };
    key <AE11>   {      [0xffd4]       };
    key <AE12>   {      [0xffd5]       };
};
EOF

setxkbmap -device $remote_id -print | sed 's/\(xkb_symbols.*\)"/\1+custom(remote)"/' | xkbcomp -I/tmp/xkb -i $remote_id -synch - $DISPLAY 2>/dev/null