
# -----------------------------------------------------------------------------
#          FILE: csmith.zsh-theme
#   DESCRIPTION: oh-my-zsh theme file
#        AUTHOR: Chris Smith
#       VERSION: 0.1
#    SCREENSHOT: coming soon
# -----------------------------------------------------------------------------

function tab_title() {
  local REPO=$(basename `git rev-parse --show-toplevel 2> /dev/null` 2> /dev/null) || return
  if [[ -z $REPO ]]
  then
    echo "%20<…<${PWD/#$HOME/~}%>>"   # 20 char left truncated PWD
  else
    echo "%20>…>$REPO%>>🔹"   # 20 char right truncated
  fi
}

ZSH_THEME_TERM_TAB_TITLE_IDLE='$(tab_title)'
ZSH_THEME_TERM_TITLE_IDLE="%n@%m"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[red]%}⬆%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"

function git_remote_info() {
  ref=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2> /dev/null) || return
  echo "%{$fg_bold[yellow]%}(${ref})"
}

PROMPT='%{$fg[blue]%}[${PWD/#$HOME/~}% ]%B
%(?.%{$fg[green]%}➦.%{$fg[red]%}✘) %b '

RPROMPT='$(git_prompt_info) $(git_remote_info) $(git_prompt_status)%{$reset_color%}'
