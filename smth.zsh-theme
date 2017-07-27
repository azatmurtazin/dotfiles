SMTH_COLOR=${SMTH_COLOR:-green}
SMTH_PATH_COLOR=${SMTH_PATH_COLOR:-blue}
SMTH_USE_GIT=${SMTH_USE_GIT:-}
SMTH_SHOW_USER=${SMTH_SHOW_USER:-yes}

function prompt_char {
  if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

function smth_git_inf {
  if [ $SMTH_USE_GIT -a $SMTH_USE_GIT != 'no' ]; then git_prompt_info; fi
}

if [ $SMTH_SHOW_USER -a $SMTH_SHOW_USER != 'no' ]; then
  PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[$SMTH_COLOR]%}%n@)%m %{$fg_bold[$SMTH_PATH_COLOR]%}%(!.%1~.%~) $(smth_git_inf)%_$(prompt_char)%{$reset_color%} '
else
  PROMPT='%{$fg_bold[$SMTH_PATH_COLOR]%}%(!.%1~.%~) $(smth_git_inf)%_$(prompt_char)%{$reset_color%} '
fi

# vi: ft=zsh :
