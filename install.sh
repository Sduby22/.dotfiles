PWD=`pwd`

ln -s ${PWD}/aria2_rpc ~/.config

# Rime
# ln -s ./Rime ~/Library

# skhd & yabai
ln -s ${PWD}/skhd ~/.config
ln -s ${PWD}/yabai ~/.config


cd ./aria2_rpc && ./mac_install.sh


