source ~/.secrets.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load all custom zsh scripts from ~/.zshrc-scripts
if [[ -d ~/.zshrc-scripts ]]; then
  for file in ~/.zshrc-scripts/*.{zsh,sh}(N); do
    if [[ -e "$file" ]]; then
      source "$file"
    fi
  done
fi

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/wim.wenigerkind/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# bun
[ -s "/Users/wim.wenigerkind/.bun/_bun" ] && source "/Users/wim.wenigerkind/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/Users/wim.wenigerkind/.bin:$PATH"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
#source ~/.oh-my-zsh.zsh
#eval "$(oh-my-posh init zsh)"


neofetch

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

export PATH="/Users/wim.wenigerkind/Library/Application Support/JetBrains/Toolbox/scripts:$PATH"
