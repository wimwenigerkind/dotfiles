#
# .zshrc
#
# @author Wim Wenigerkind
#

# Load all custom zsh scripts from ~/.zshrc-scripts
if [[ -d ~/.zshrc-scripts ]]; then
  for file in ~/.zshrc-scripts/*.{zsh,sh}(N); do
    if [[ -e "$file" ]]; then
      source "$file"
      echo "Sourced: ${file##*/}"
    fi
  done
else
  mkdir -p ~/.zshrc-scripts
  echo "Created directory: ~/.zshrc-scripts"
fi

echo "Hello your Terminal loaded successfully"