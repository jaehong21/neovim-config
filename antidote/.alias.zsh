# aliases
alias zshconfig="nvim $HOME/.zshrc"
alias zshapply="source $HOME/.zshrc"
alias secretconfig="nvim $HOME/.secret.zsh"
alias colimaconfig="nvim $HOME/.colima/default/colima.yaml"
alias brewconfig="nvim $HOME/.config/nvim/Brewfile"
alias brewapply="brew bundle --file=$HOME/.config/nvim/Brewfile --cleanup --no-lock"
alias antidoteconfig="nvim $HOME/.zsh_plugins.txt"
alias kittyconf="nvim $HOME/.config/nvim/kitty.conf"
alias vc-clean="rm -rf ~/.local/state/nvim/swap /Users/jetty/.local/state/nvim/lsp.log"
alias colima-network-clean="rm -rf ~/.colima/_lima/_networks/user-v2"

alias tf="terraform"
alias tg="terragrunt"
alias k="kubectl"
alias kns="kubectl config set-context --current --namespace"
alias kcs="kubectl config use-context"
alias k9s="k9s -A"

alias python="python3"
alias pip="pip3"

alias ..='pwd && cd .. && pwd'
alias ...='pwd && cd ../.. && pwd'
alias ....='pwd && cd ../../.. && pwd'
alias .....='pwd && cd ../../../.. && pwd'
alias ......='pwd && cd ../../../../.. && pwd'
# alias .4='pwd && cd ../../../.. && pwd'
# alias .5='pwd && cd ../../../../.. && pwd'
