Caps_to_Ctrl() {
    xmodmap - <<-EOF
clear lock
clear control 
add control = Control_L Control_R
keycode 66 = Control_R
EOF
}

Caps_to_Ctrl
Caps_to_Ctrl
xset r rate 230 30
