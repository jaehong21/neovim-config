zmodload zsh/datetime
zsh_start_time=$EPOCHREALTIME

# --- oh-my-posh ---
eval "$(oh-my-posh init zsh --config $HOME/.config/nvim/oh-my-posh.toml)"

# --- PATH ---
path=(
    /usr/local/bin $HOME/bin
    $HOME/.local/bin $HOME/go/bin # go
    $HOME/.local/share/bob/nvim-bin # bob-nvim
    # ${KREW_ROOT:-$HOME/.krew}/bin # krew
    $path
)

# --- DEFAULT ---
export EDITOR=nvim
export TERM=xterm-256color
export AWS_PROFILE=ch-dev

# --- ANTIDOTE ---
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh # installed by brew
antidote load

# --- MISE ---
eval "$(mise activate zsh)"

# --- COMPLETION ---
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

# installed by mise
# (( $+commands[mise] )) && (( $+commands[terraform] )) && complete -o nospace -C $(mise which terraform) terraform

# --- ZSH FILES ---
source $HOME/.secret.zsh
source $HOME/.alias.zsh

zsh_end_time=$EPOCHREALTIME
zsh_load_time=$(echo "($zsh_end_time - $zsh_start_time) * 1000" | bc)
echo "zsh startup time: ${zsh_load_time}ms"
