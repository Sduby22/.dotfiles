source ~/.profile
source ~/alias
if status is-interactive
    # Commands to run in interactive sessions can go here
    if [ "$(uname -s)" = "Darwin" ];
	brew shellenv | source
        alias xcp=pbcopy
        alias brew='/opt/homebrew/bin/brew' # ARM Homebrew
        alias ibrew='arch -x86_64 /usr/local/bin/brew' # X86 Homebrew
    else
        alias xcp='xclip -selection clipboard'
    end

    if [ $TERM = "xterm-kitty" ];
        alias ssh="kitty +kitten ssh"
    end

    alias lgit=lazygit
    alias cl=clear
    alias fy='fy -S'
    alias fanyi='fanyi -S'
    alias v=nvim
    alias em="emacsclient -c"
    alias j=z
    alias rmds='find . | egrep "DS|dSYM" | xargs rm'
    alias termcolor='alacritty-colorscheme -C ~/.config/alacritty/base16-alacritty/colors'

    function myproxy
        export ALL_PROXY=http://127.0.0.1:7890;
        export HTTP_PROXY=http://127.0.0.1:7890;
        export HTTPS_PROXY=http://127.0.0.1:7890;
    end

    function unproxy
        export ALL_PROXY=;
        export HTTP_PROXY=;
        export HTTPS_PROXY=;
    end

    function mkcd
        mkdir -p $argv && cd $argv; 
    end

    export NVM_NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
    myproxy

    set -Ux PYENV_ROOT $HOME/.pyenv
    set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

    pyenv init - | source
    alias l=exa
end

thefuck --alias | source
pyenv init - | source
source ~/.config/fish/nvm.fish
