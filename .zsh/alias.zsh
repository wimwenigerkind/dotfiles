# General
alias claude='~/.claude/local/claude'
alias ip='ipconfig getifaddr en0'
alias zshrcreload='source ~/.zshrc'
alias sc='zshrcreload'

# Editors / Configs
alias wim='nvim'
alias ww='nvim'
alias sshconfig='nvim ~/.ssh/'
alias zshrcconfig='nvim ~/.zshrc'

# Navigation
alias cd='z' # zoxide
alias cl='cd && clear'
alias up='cd ..'
alias back='cd -'
alias cdir='cd "${_%/*}"'
alias ll='nu -c "ls"'

# Project shortcuts
alias goDev='cd ~/Development/ && sd'
alias goDownloads='cd ~/Downloads/ && sd'
alias goOneDownloads='cd ~/OneDrive/Downloads/ && sAll'
alias goOneDocs='cd ~/OneDrive/Documents/ && sAll'
alias goOneDev='cd ~/OneDrive/development/'
alias goSym='cd ~/SymfonyProjects/'

# Composer / Symfony / Shopware / PHP
alias c='composer'
alias cfix='composer update --lock --no-install --no-scripts'
alias bc='bin/console'
alias bcdmm='bin/console doctrine:migrations:migrate'
alias bccc='bin/console ca:cl:al'
alias bbs='bin/build-storefront.sh'
alias bba='bin/build-administration.sh'

# Docker
alias d='docker'
alias dup='docker compose up -d'
alias ddown='docker compose down'

# Funny
alias ssio='ssh'
