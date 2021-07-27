if [[ "$(uname -s)" = "Darwin" ]]; then
  case "$(arch)" in
    "i386" )
      # x86 Mac
      source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
      source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
      ;;
    "arm64" )
      # Mac with Apple Silicon
      alias brew='/opt/homebrew/bin/brew' # ARM Homebrew
      alias ibrew='arch -x86_64 /usr/local/bin/brew' # X86 Homebrew
      source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
      [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
      ;;
  esac
else
  # Fedora
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

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
export PS1="%{$fg[$bracket_color]%}[%{$reset_color%}%m:%(5~|%-1~/.../%3~|%4~)%{$fg[$bracket_color]%}]%{$reset_color%}%(!.#.$) "

# alias npm=cnpm
alias lgit=lazygit
alias ls='ls -G'
alias xcp=pbcopy
alias cl=clear
alias myproxy="source ~/scripts/myproxy.sh"
alias unproxy="source ~/scripts/unproxy.sh"
# alias rg=ranger
alias vim=nvim
alias v=nvim

myproxy

# export NVM_DIR="$HOME/.nvm"
  # [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  # [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

mkcd() { mkdir -p "$@" && cd "$@"; }

alias rmds='find . | egrep "DS|dSYM" | xargs rm'
alias clang='/usr/bin/clang'
