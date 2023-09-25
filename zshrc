if [[ "$(uname -s)" = "Darwin" ]]; then
  # Mac with Apple Silicon
  alias xcp=pbcopy
  alias brew='/opt/homebrew/bin/brew' # ARM Homebrew
  alias ibrew='arch -x86_64 /usr/local/bin/brew' # X86 Homebrew
else
  alias xcp='xclip -selection clipboard'
fi

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='vim'
fi

if [[ $TERM = "xterm-kitty" ]]; then
  alias ssh="kitty +kitten ssh"
fi


ansi_color=(red green yellow blue cyan magenta)
bracket_color=${ansi_color[$((1 + $RANDOM % ${#ansi_color[*]}))]}
export PS1="%{$fg[$bracket_color]%}%n%{$reset_color%}@%m: %(5~|%-1~/.../%2~|%3~)%(!.#.$) "
#export PS1="%{$fg[$bracket_color]%}[%{$reset_color%}%m %(5~|%-1~/.../%3~|%4~)%{$fg[$bracket_color]%}]%{$reset_color%}%(!.#.$) "

# alias npm=cnpm
alias lgit=lazygit
alias cl=clear
alias fy='fy -S'
alias fanyi='fanyi -S'
myproxy() {
  export all_proxy=http://127.0.0.1:7890;
  export http_proxy=http://127.0.0.1:7890;
  export https_proxy=http://127.0.0.1:7890;
}
unproxy() {
  export all_proxy=;
  export http_proxy=;
  export https_proxy=;
}

alias v=nvim

# export NVM_DIR="$HOME/.nvm"
  # [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  # [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

mkcd() { mkdir -p "$@" && cd "$@"; }

alias rmds='find . | egrep "DS|dSYM" | xargs rm'
alias termcolor='alacritty-colorscheme -C ~/.config/alacritty/base16-alacritty/colors'

export PATH=$PATH:/Users/sduby/.config/alacritty/color_scripts:/Users/sduby/Library/Python/3.9/bin

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
if [ \( -f "/Users/sduby/.alilang-ssh.exp" \) -a \( ! -f /Users/sduby/.alilang-lock-922463 \) ]; then touch /Users/sduby/.alilang-lock-922463;expect /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-lock-922463;fi
if [ \( -f "/Users/sduby/.alilang-ssh.exp" \) -a \( ! -f /Users/sduby/.alilang-lock-648911 \) ]; then touch /Users/sduby/.alilang-lock-648911;expect /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-lock-648911;fi
if [ \( -f "/Users/sduby/.alilang-ssh.exp" \) -a \( ! -f /Users/sduby/.alilang-lock-253203 \) ]; then touch /Users/sduby/.alilang-lock-253203;expect /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-lock-253203;fi
if [ \( -f "/Users/sduby/.alilang-ssh.exp" \) -a \( ! -f /Users/sduby/.alilang-lock-396323 \) ]; then touch /Users/sduby/.alilang-lock-396323;expect /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-lock-396323;fi
if [ \( -f "/Users/sduby/.alilang-ssh.exp" \) -a \( ! -f /Users/sduby/.alilang-lock-297343 \) ]; then touch /Users/sduby/.alilang-lock-297343;expect /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-lock-297343;fi
if [ \( -f "/Users/sduby/.alilang-ssh.exp" \) -a \( ! -f /Users/sduby/.alilang-lock-403086 \) ]; then touch /Users/sduby/.alilang-lock-403086;expect /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-lock-403086;fi
if [ \( -f "/Users/sduby/.alilang-ssh.exp" \) -a \( ! -f /Users/sduby/.alilang-lock-504687 \) ]; then touch /Users/sduby/.alilang-lock-504687;expect /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-lock-504687;fi
if [ \( -f "/Users/sduby/.alilang-ssh.exp" \) -a \( ! -f /Users/sduby/.alilang-lock-681308 \) ]; then touch /Users/sduby/.alilang-lock-681308;expect /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-lock-681308;fi
if [ \( -f "/Users/sduby/.alilang-ssh.exp" \) -a \( ! -f /Users/sduby/.alilang-lock-798848 \) ]; then touch /Users/sduby/.alilang-lock-798848;expect /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-lock-798848;fi
if [ \( -f "/Users/sduby/.alilang-ssh.exp" \) -a \( ! -f /Users/sduby/.alilang-lock-507499 \) ]; then touch /Users/sduby/.alilang-lock-507499;expect /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-lock-507499;fi
if [ \( -f "/Users/sduby/.alilang-ssh.exp" \) -a \( ! -f /Users/sduby/.alilang-lock-866749 \) ]; then touch /Users/sduby/.alilang-lock-866749;expect /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-ssh.exp;rm -f /Users/sduby/.alilang-lock-866749;fi
