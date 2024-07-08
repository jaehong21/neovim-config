# `spectrum_ls` to see all colors

# custom_kube_ps1() {
#     local kube_ps1_output=$(kube_ps1)
#     local symbol=$(echo $kube_ps1_output | cut -d'(' -f2 | cut -d'|' -f1)
#     local context=$(echo $kube_ps1_output | cut -d'|' -f2 | cut -d':' -f1)
#     local namespace=$(echo $kube_ps1_output | cut -d':' -f2 | cut -d')' -f1)
#     echo "$symbol%{$fg[blue]%}($context%{$fg[blue]%})"
# }

custom_aws_profile() {
  # export AWS_PROFILE=ch-dev
  local profile=$AWS_PROFILE
  if [ -z $profile ]; then
    echo "%{$FG[214]%}(🚀default%{$fg[orange]%})"
  else
    echo "%{$FG[214]%}(🚀$profile%{$fg[orange]%})"
  fi
}

PROMPT='%{$FG[008]%}user:$(whoami) '
PROMPT+='$(custom_aws_profile)'
PROMPT+='$(kube_ps1)'
# PROMPT+=$'\n'
PROMPT+='%{$fg_bold[green]%} %{$fg[green]%}%c %{$fg_bold[cyan]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

# black, red, green, yellow, blue, magenta, cyan, white
KUBE_PS1_SYMBOL_DEFAULT='⛴️'
KUBE_PS1_SEPARATOR=""
KUBE_PS1_DIVIDER=""
KUBE_PS1_NS_ENABLE=false
KUBE_PS1_CTX_COLOR="blue"
KUBE_PS1_NS_COLOR="blue"
KUBE_PS1_PREFIX_COLOR="blue"
KUBE_PS1_SUFFIX_COLOR="blue"
