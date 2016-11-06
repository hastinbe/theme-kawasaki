#!/usr/bin/fish
# 
#  kawasaki.theme
#
#  A theme for the fish shell.
#
#  Copyright (c) 2016 Beau Hastings.
#  License: GNU General Public License v2
#
#  Author: Beau Hastings <beausy@gmail.com>
#

#
#  Notes:
#   To use the theme's virtualenv prompt indicator you should add the following to your init.fish (https://github.com/oh-my-fish/oh-my-fish#dotfiles)
#   set --export VIRTUAL_ENV_DISABLE_PROMPT 1

# Override default options
#
## Display the local time
#set -g theme_display_time yes
#
## Display the user's current group
#set -g theme_display_group no
#
## Display git branch status
#set -g theme_display_git no
#
## Display job count
#set -g theme_display_jobs no
#
## By default job count won't display if there are no jobs
#set -g theme_display_jobs_always yes
#
## Don't display if the current working directory is readable/writable
#set -g theme_display_rw no
#
## Don't display virtualenv
#set -g theme_display_virtualenv no
#

# Colors
# TODO: consider displaying colors in the following order: cyan, green, yellow, orange, purple
#
set -g theme_color_error                           red
set -g theme_color_superuser                       red
set -g theme_color_user                            white
set -g theme_color_group                           666666
set -g theme_color_host                            brgreen
set -g theme_color_separator                       brblack
set -g theme_color_bracket                         brblue
set -g theme_color_normal                          normal
set -g theme_color_time                            666666
set -g theme_color_path                            brwhite
set -g theme_color_prompt                          white
set -g theme_color_virtualenv                      bryellow

set -g theme_color_status_prefix                   brblue
set -g theme_color_status_jobs                     brgreen
set -g theme_color_status_rw                       brwhite

set -g theme_prompt_char_normal                    '$'
set -g theme_prompt_char_superuser                 '#'
set -g theme_prompt_char                           "$theme_prompt_char_normal"

set -g theme_prompt_superuser_glyph                \u2605
set -g theme_prompt_userhost_separator             ':'

set -g theme_prompt_segment_separator_char         ' '
set -g theme_prompt_segment_separator_color        normal

set -g theme_prompt_status_jobs_char               '%'
set -g theme_prompt_status_rw_char                 '.'
set -g theme_prompt_status_separator_char          '/'

set -g theme_prompt_virtualenv_char_begin          '('
set -g theme_prompt_virtualenv_char_end            ')'
set -g theme_prompt_virtualenv_color_char_begin    normal
set -g theme_prompt_virtualenv_color_char_end      normal

set -g theme_display_time_format                   '+%I:%M'

#set -g __fish_git_prompt_color_prefix      
#set -g __fish_git_prompt_color_suffix      
#set -g __fish_git_prompt_color_bare        
set -g __fish_git_prompt_color_merging             red
set -g __fish_git_prompt_color_branch              brblue
#set -g __fish_git_prompt_color_flags       
#set -g __fish_git_prompt_color_upstream    
#
#__fish_git_prompt_describe_style       default|contains|describe|branch
set -g __fish_git_prompt_showcolorhints            yes
set -g __fish_git_prompt_show_informative_status   yes
set -g __fish_git_prompt_char_stateseparator       ' '

# Unofficial fish_git_prompt settings
set -g __fish_git_prompt_char_branch_begin         ''
set -g __fish_git_prompt_char_branch_end           ''
set -g __fish_git_prompt_color_branch_begin        bryellow
set -g __fish_git_prompt_color_branch_end          bryellow


function fish_prompt
    set -l sep (set_color $theme_prompt_segment_separator_color)$theme_prompt_segment_separator_char(__theme_reset_color)
    set -l line1 (string join "$sep" \
        (__theme_print_time) \
        (__theme_print_userhost) \
        (__theme_print_pwd) \
        (__theme_print_git_status) \
        (__theme_print_jobs) \
        (__theme_print_pwd_rw) \
    )
    set -l line2 (string join " " \
        (__theme_print_virtualenv) \
        (__theme_print_prompt_char)\
    )

    echo "$line1"
    echo "$line2 "
end
