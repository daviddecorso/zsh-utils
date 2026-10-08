alias hs="history"
alias hsg="history | grep "
alias findg="find . | grep "

alias home="cd ~"
alias coding="cd ~/coding"
alias ..="cd ..; ls"
alias ...="cd ../..; ls"
alias ....="cd ../../..; ls"
alias .....="cd ../../../..; ls"
alias ......="cd ../../../../..; ls"
alias .......="cd ../../../../../..; ls"
alias ........="cd ../../../../../../..; ls"

alias ls="eza --icons --group-directories-first"
alias la="ls -A"
alias ll="eza -lah --icons --group-directories-first"
alias v="clear; eza --git -h -l --group-directories-first --time-style long-iso --color automatic"
alias cat="bat"

alias pr="pnpm run"
alias pi="pnpm install"
alias pd="pnpm run dev"
alias brewup="brew update && brew upgrade"
alias secret="openssl rand -hex 32"

alias ag="antigravity"
alias ag.="antigravity . --new-window"
alias arcIcon="defaults write company.thebrowser.Browser currentAppIconName -string "
alias c="claude"

alias cleanup-mac="echo '🧹 Sweeping up developer trash...' && \
rm -rf ~/Library/Developer/Xcode/DerivedData/* && \
echo '✅ Xcode Derived Data cleared' && \
xcrun simctl delete unavailable && \
echo '✅ Unavailable Simulators deleted' && \
npm cache clean --force && \
echo '✅ NPM cache cleared' && \
yarn cache clean && \
echo '✅ Yarn cache cleared' && \
rm -rf ~/.gradle/caches/* && \
echo '✅ Gradle caches cleared' && \
brew cleanup && \
echo '✅ Homebrew cleanup complete! Your Mac is clean. ✨'"
