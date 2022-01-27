#!/bin/sh

declare personal_bin="/Users/$USER/bin"
declare cfg=".bash_profile"

[ -n $ZSH_VERSION ] && 
cfg=".zprofile"

[[ -d $personal_bin ]] || mkdir $personal_bin &&
echo export PATH="$personal_bin:\$PATH" >> /Users/$USER/$cfg

chmod +x ./sq.sh &&
cp ./sq.sh $personal_bin/sq