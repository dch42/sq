#!/bin/sh

declare personal_bin="/Users/$USER/bin"

[[ -d $personal_bin ]] || mkdir $personal_bin &&
echo export PATH="$personal_bin:\$PATH" >> /Users/$USER/.bash_profile

chmod +x ./sq.sh &&
cp ./sq.sh $personal_bin/sq