# enable antigen
source $(brew --prefix)/share/antigen/antigen.zsh

# Load FPATH functions
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

# Load oh-my-zsh
antigen use oh-my-zsh

# Bundles
antigen bundles <<EOBUNDLES
  git
  gem
  heroku
  macos
  fasd
  key-bindings

  djui/alias-tips

  mafredri/zsh-async@main
  zsh-users/zsh-completions
  zsh-users/zsh-autosuggestions
  sindresorhus/pure@v1.5.2

  # these should be at last!
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
EOBUNDLES

# Apply antigen
antigen apply

# bind UP and DOWN arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Key bindings
# For iterm2 add keybinding escape sequence
bindkey -e
bindkey '^[f' forward-word
bindkey '^[b' backward-word
bindkey '^[h' backward-delete-word
bindkey '^[d' backward-kill-line

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# History settings
HISTFILE=~/.zhistory
HISTSIZE=100000
SAVEHIST=100000

# Don't show duplicate history entires
setopt hist_find_no_dups

# Remove unnecessary blanks from history
setopt hist_reduce_blanks

# Share history between instances
setopt share_history

setopt hist_ignore_space
setopt hist_ignore_all_dups

# Init rbenv and nodenv
eval "$(rbenv init -)"
eval "$(nodenv init -)"

# Init pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$HOME/.nodenv/bin:$PATH"

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"
export PATH=".git/safe/../../node_modules/.bin:$PATH"

# Create a JAVA_HOME variable, determined dynamically
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_211.jdk/Contents/Home
# Add that to the global PATH variable
export PATH=${JAVA_HOME}/bin:$PATH
# Set Android_HOME
export ANDROID_HOME=~/Library/Android/sdk/
# Add the Android SDK to the ANDROID_HOME variable
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
#Set GRADLE_HOME
export GRADLE_HOME=/Applications/Android\ Studio.app/Contents/gradle/gradle-5.1.1
export PATH=$PATH:$GRADLE_HOME/bin

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# functions
if [ -d ~/.bash_functions ]; then
  for file in ~/.bash_functions/*; do
    . "$file"
  done
fi

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
