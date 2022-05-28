if status is-interactive
    # Commands to run in interactive sessions can go here
    if [ "$(uname -s)" = "Darwin" ];
        alias xcp=pbcopy
        alias brew='/opt/homebrew/bin/brew' # ARM Homebrew
        alias ibrew='arch -x86_64 /usr/local/bin/brew' # X86 Homebrew
        export PATH="/opt/homebrew/opt/bison/bin:$PATH"
    else
        alias xcp='xclip -selection clipboard'
    end

    if [ "$SSH_CONNECTION" = "" ];
        export EDITOR='vi'
    else
        export EDITOR='vim'
    end

    if [ $TERM = "xterm-kitty" ];
        alias ssh="kitty +kitten ssh"
    end

    alias lgit=lazygit
    alias cl=clear
    alias fy='fy -S'
    alias fanyi='fanyi -S'

    function myproxy
        export ALL_PROXY=http://127.0.0.1:7890;
    end

    function unproxy
        export ALL_PROXY=;
    end

    function mkcd
        mkdir -p $argv && cd $argv; 
    end

    alias v=nvim
    alias j=z
    myproxy


    alias rmds='find . | egrep "DS|dSYM" | xargs rm'
    alias termcolor='alacritty-colorscheme -C ~/.config/alacritty/base16-alacritty/colors'
end
