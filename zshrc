if [[ "$(uname -s)" = "Darwin" ]]; then
  # Mac with Apple Silicon
  alias xcp=pbcopy
  alias brew='/opt/homebrew/bin/brew' # ARM Homebrew
  alias ibrew='arch -x86_64 /usr/local/bin/brew' # X86 Homebrew
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
else
  # Arch & Manjaro
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
  source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  [[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
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

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
#    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#	eval "$("$BASE16_SHELL/profile_helper.sh")"

# autoload -U zsh-newuser-install
# zsh-newuser-install -f
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/Users/osennyaya/.zshrc'

autoload -U colors && colors
autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

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

eval "$(pyenv init -)"

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

# pnpm
export PNPM_HOME="/Users/sduby/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end