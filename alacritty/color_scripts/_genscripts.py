import os,stat

prefix = 'alacritty-colorscheme -C ~/.config/alacritty/base16-alacritty/colors -V apply'
home = os.getenv("HOME")
for fname in os.listdir('../base16-alacritty/colors'):
    if '256' in fname:
        continue
    fname = fname[:-4]
    command = f'{prefix} {fname}.yml'
    with open(fname, 'w+', encoding='utf8') as f:
        f.write("#!/bin/sh\n")
        f.write(command)
    st = os.stat(fname)
    os.chmod(fname, st.st_mode | stat.S_IEXEC)

with open(f'{home}/.zshrc', 'a', encoding='utf8') as f:
    f.write('\nexport PATH=$PATH:~/.config/alacritty/color_scripts/')


