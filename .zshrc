source ~/.secrets.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# OrbStack (docker/kubectl completions)
source ~/.orbstack/shell/init.zsh

# Cached compinit
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh-24) ]]; then
  compinit -C  # dump is fresh, skip security check
else
  compinit     # regenerate dump
fi
autoload -Uz bashcompinit && bashcompinit

source ~/.zsh/export.zsh

# Load custom zsh scripts
if [[ -d ~/.zshrc-scripts ]]; then
  for file in ~/.zsh/zshrc-scripts/*.{zsh,sh}(N); do
    if [[ -e "$file" ]]; then
      source "$file"
    fi
  done
fi

# Hardcoded path avoids slow $(brew --prefix) subshell
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/.zsh/alias.zsh

source ~/.zsh/eval.zsh

#source ~/.oh-my-zsh.zsh
#eval "$(oh-my-posh init zsh)"

# ===================================
# Dynamic
# ===================================

# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/wim.wenigerkind/Library/Application Support/Herd/config/php/84/"

# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/wim.wenigerkind/Library/Application Support/Herd/config/php/83/"

# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/wim.wenigerkind/Library/Application Support/Herd/config/php/82/"

# Herd injected PHP 8.1 configuration.
export HERD_PHP_81_INI_SCAN_DIR="/Users/wim.wenigerkind/Library/Application Support/Herd/config/php/81/"

# Herd injected PHP 8.0 configuration.
export HERD_PHP_80_INI_SCAN_DIR="/Users/wim.wenigerkind/Library/Application Support/Herd/config/php/80/"

# Herd injected PHP 7.4 configuration.
export HERD_PHP_74_INI_SCAN_DIR="/Users/wim.wenigerkind/Library/Application Support/Herd/config/php/74/"

# Herd injected PHP binary.
export PATH="/Users/wim.wenigerkind/Library/Application Support/Herd/bin/":$PATH

# Herd injected PHP 8.5 configuration.
export HERD_PHP_85_INI_SCAN_DIR="/Users/wim.wenigerkind/Library/Application Support/Herd/config/php/85/"

# Herd injected NVM configuration
export NVM_DIR="/Users/wim.wenigerkind/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

export PATH="/Users/wim.wenigerkind/Library/Application Support/JetBrains/Toolbox/scripts:$PATH"
