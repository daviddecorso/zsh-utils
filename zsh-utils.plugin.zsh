# Set ZSH_UTILS_ALIASES=1 before sourcing to also load the aliases; some replace ls, cat and cd-style commands.
0=${(%):-%N}
_zsh_utils_dir=${0:A:h}

(( ${fpath[(Ie)$_zsh_utils_dir/functions]} )) || fpath=($_zsh_utils_dir/functions $fpath)
autoload -Uz $_zsh_utils_dir/functions/*(.:t)
(( ${path[(Ie)$_zsh_utils_dir/bin]} )) || path+=($_zsh_utils_dir/bin)

if [[ $ZSH_UTILS_ALIASES == 1 ]]; then
  source $_zsh_utils_dir/aliases/general.zsh
  source $_zsh_utils_dir/aliases/git.zsh
fi

unset _zsh_utils_dir
