PWD=`pwd`

ln -s ${PWD}/aria2_rpc ~/.config

# Rime
# ln -s ./Rime ~/Library

# skhd & yabai & spacebar
ln -s ${PWD}/skhd ~/.config
ln -s ${PWD}/yabai ~/.config
ln -s ${PWD}/spacebar ~/.config

cd ./aria2_rpc && ./mac_install.sh

ln -s ${PWD}/nvim ~/.config
