return_status="%(?:%{$fg_bold[green]%}> :%{$fg_bold[red]%}> %s)"

eval color_connector='$fg[white]'
eval color_name='$fg[blue]'
eval color_at='$fg[blue]'
eval color_machine='$fg[blue]'
eval color_time='$fg_bold[grey]'
eval color_path=''
eval color_branch=''
eval color_status=''

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$color_connector%}:%{$reset_color%}%{$color_branch%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{$color_connector%}┌[%{$reset_color%}%{$color_name%}%n%{$reset_color%}%{$color_at%}@%{$color_machine%}%m%{$reset_color%}%{$color_connector%}]-[%{$reset_color%}%{$color_path%}%~%{$reset_color%}%{$color_branch%}$(git_prompt_info)%{$reset_color%}%{$color_connector%}]%{$reset_color%}
%{$color_connector%}└${return_status}%{$reset_color%}'

RPROMPT='%{$(echotc UP 1)%}%{$color_time%}%t%{$reset_color%}%{$(echotc DO 1)%}'
