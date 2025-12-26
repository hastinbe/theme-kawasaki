#!/usr/bin/fish
#
#  kawasaki.theme
#
#  A theme for the fish shell.
#
#  Copyright (c) 2016 Beau Hastings.
#  License: GNU General Public License v2
#
#  Author: Beau Hastings <beau@saweet.net>
#

function __default_var
    set -q $argv[1]; or set -gx $argv
end

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
# Display the system hostname
#set -g theme_display_hostname no
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
## Display the battery
#set -g theme_display_batt no
#set -g theme_display_batt_icon no
#

# ============================================================================
# Color definitions
# ============================================================================
# TODO: consider displaying colors in the following order: cyan, green, yellow, orange, purple

# Basic colors
__default_var theme_color_error                            red
__default_var theme_color_superuser                        red
__default_var theme_color_user                             white
__default_var theme_color_group                            666666
__default_var theme_color_host                             brgreen
__default_var theme_color_separator                        brblack
__default_var theme_color_bracket                          brblue
__default_var theme_color_normal                           normal

# Prompt element colors
__default_var theme_color_time                             666666
__default_var theme_color_path                             brwhite
__default_var theme_color_prompt                           white
__default_var theme_color_virtualenv                       bryellow

# Status indicator colors
__default_var theme_color_status_prefix                    brblue
__default_var theme_color_status_jobs                      brgreen
__default_var theme_color_status_rw                        brwhite

# Battery colors
__default_var theme_color_batt_icon                        white
__default_var theme_color_batt_charging                    brgreen
__default_var theme_color_batt_discharging                 red
__default_var theme_color_batt_0                           red
__default_var theme_color_batt_25                          red
__default_var theme_color_batt_50                          bryellow
__default_var theme_color_batt_75                          bryellow
__default_var theme_color_batt_100                         brgreen

# ============================================================================
# Prompt character definitions
# ============================================================================

__default_var theme_prompt_char_normal                     '$'
__default_var theme_prompt_char_superuser                  '#'
__default_var theme_prompt_char                            "$theme_prompt_char_normal"
__default_var theme_prompt_superuser_glyph                 \u2605

# Separators
__default_var theme_prompt_userhost_separator              '@'
__default_var theme_prompt_group_separator                 ':'
__default_var theme_prompt_segment_separator_char          ' '
__default_var theme_prompt_segment_separator_color         normal
__default_var theme_prompt_status_separator_char           '/'

# Status indicators
__default_var theme_prompt_status_jobs_char                '%'
__default_var theme_prompt_status_rw_char                  '.'

# Virtualenv
__default_var theme_prompt_virtualenv_char_begin           '('
__default_var theme_prompt_virtualenv_char_end             ')'
__default_var theme_prompt_virtualenv_color_char_begin     normal
__default_var theme_prompt_virtualenv_color_char_end       normal

# Battery symbols
__default_var theme_prompt_batt_charging_char              '↑'
__default_var theme_prompt_batt_discharging_char           '↓'
__default_var theme_prompt_batt_0                          ''
__default_var theme_prompt_batt_25                         ''
__default_var theme_prompt_batt_50                         ''
__default_var theme_prompt_batt_75                         ''
__default_var theme_prompt_batt_100                        ''

# ============================================================================
# Display format settings
# ============================================================================

__default_var theme_display_time_format                    '+%I:%M'

# Git prompt settings
__default_var __fish_git_prompt_color_merging              red
__default_var __fish_git_prompt_color_branch               brblue
__default_var __fish_git_prompt_showcolorhints             yes
__default_var __fish_git_prompt_show_informative_status    yes
__default_var __fish_git_prompt_char_stateseparator        ' '

# Unofficial fish_git_prompt settings
__default_var __fish_git_prompt_char_branch_begin          ''
__default_var __fish_git_prompt_char_branch_end            ''
__default_var __fish_git_prompt_color_branch_begin         bryellow
__default_var __fish_git_prompt_color_branch_end          bryellow

# Initialize cached values
function __theme_init_reset_color_cache
    set -g __theme_reset_color_cache (set_color $theme_color_normal)
end

__theme_init_reset_color_cache

# ============================================================================
# Prompt segment printing functions
# ============================================================================

function __theme_print_battery_status
    test "$theme_display_batt" != 'yes'; and return
    set -l acpi (command acpi --battery 2>/dev/null)
    set -l batt (string match -r '\d+%' $acpi | string trim -c '%')
    set -l batt_state_symbol
    set -l batt_symbol $theme_prompt_batt_100
    set -l batt_state_color

    test -z $batt; and return

    if string match -q '*Discharging*' $acpi
        set batt_state_color $theme_color_batt_discharging
        set batt_state_symbol $theme_prompt_batt_discharging_char
    else if string match -q '*Charging*' $acpi
        set batt_state_color $theme_color_batt_charging
        set batt_state_symbol $theme_prompt_batt_charging_char
    end

    if test $batt -ge 85
        set batt_color $theme_color_batt_100
        set batt_symbol $theme_prompt_batt_100
    else if test $batt -ge 75
        set batt_color $theme_color_batt_75
        set batt_symbol $theme_prompt_batt_75
    else if test $batt -ge 50
        set batt_color $theme_color_batt_50
        set batt_symbol $theme_prompt_batt_50
    else if test $batt -ge 25
        set batt_color $theme_color_batt_25
        set batt_symbol $theme_prompt_batt_25
    else
        set batt_color $theme_color_batt_0
        set batt_symbol $theme_prompt_batt_0
    end

    if test "$theme_display_batt_icon" = 'yes'
        print_colored "$batt_symbol" $theme_color_batt_icon
    end
    # Batch the percentage and state symbol output
    if test -n "$batt_state_symbol"
        printf '%s%s%s%s' \
            (set_color $batt_color)"$batt%" \
            (set_color $batt_state_color)$batt_state_symbol \
            $__theme_reset_color_cache
    else
        print_colored "$batt%" $batt_color
    end
end

function __theme_print_git_status
    test "$theme_display_git" = 'no'; and return
    set -l git_prompt (__fish_git_prompt | string replace -r '^ \(' '' | string replace -r '\)$' '')

    test -z "$git_prompt"; and return

    print_colored $__fish_git_prompt_char_branch_begin $__fish_git_prompt_color_branch_begin
    printf '%s' $git_prompt
    print_colored $__fish_git_prompt_char_branch_end $__fish_git_prompt_color_branch_end
end

function __theme_print_jobs
    test "$theme_display_jobs" = 'no'; and return
    set -l num_jobs (jobs -c | command wc -l)

    if test $num_jobs -gt 0 -o "$theme_display_jobs_always" = "yes"
        printf '%s%s%s%s%s' \
            (set_color $theme_color_status_prefix)"$theme_prompt_status_jobs_char" \
            (set_color $theme_color_separator)"$theme_prompt_status_separator_char" \
            (set_color $theme_color_status_jobs)"$num_jobs" \
            $__theme_reset_color_cache
    end
end

function __theme_print_pwd
    print_colored (prompt_pwd) $theme_color_path
end

function __theme_print_pwd_rw
    test "$theme_display_rw" = 'no'; and return
    set -l rw_chars

    test -r .; and set rw_chars r
    test -w .; and set rw_chars "$rw_chars"w

    printf '%s%s%s%s%s' \
        (set_color $theme_color_status_prefix)$theme_prompt_status_rw_char \
        (set_color $theme_color_separator)$theme_prompt_status_separator_char \
        (set_color $theme_color_status_rw)$rw_chars \
        $__theme_reset_color_cache
end

function __theme_print_superuser
    if test (command id -u) -eq 0
        set -g theme_prompt_char "$theme_prompt_char_superuser"
        print_colored $theme_prompt_superuser_glyph $theme_color_superuser
    else
        set -g theme_prompt_char "$theme_prompt_char_normal"
    end
end

function __theme_print_user
    print_colored $USER $theme_color_user
end

function __theme_print_time
    test "$theme_display_time" = 'yes'; or return
    print_colored (command date $theme_display_time_format) $theme_color_time
end

function __theme_print_userhost
    echo -ns (__theme_print_superuser) (__theme_print_user) $__theme_reset_color_cache

    if test "$theme_display_group" != 'no'
        print_colored $theme_prompt_group_separator $theme_color_separator
        print_colored (id -gn) $theme_color_group
    end

    if test "$theme_display_hostname" != 'no'
        print_colored $theme_prompt_userhost_separator $theme_color_separator
        print_colored (prompt_hostname) $theme_color_host
    end
end

function __theme_print_virtualenv
    test "$theme_display_virtualenv" = 'no' -o -z "$VIRTUAL_ENV"; and return

    set -l basename (basename "$VIRTUAL_ENV")

    # special case for Aspen magic directories (http://www.zetadev.com/software/aspen/)
    if test "$basename" = "__"
        set basename (basename (dirname "$VIRTUAL_ENV"))
    end

    printf '%s%s%s%s%s' \
        (set_color $theme_prompt_virtualenv_color_char_begin)$theme_prompt_virtualenv_char_begin \
        (set_color $theme_color_virtualenv)$basename \
        (set_color $theme_prompt_virtualenv_color_char_end)$theme_prompt_virtualenv_char_end \
        $__theme_reset_color_cache
end

# ============================================================================
# Utility functions
# ============================================================================

function print_colored
    set -l bgcolor normal
    set -l fgcolor normal
    set -l text

    if contains -- -b in $argv[1]
        set bgcolor $argv[2]
        set fgcolor $argv[-1]
        set text $argv[3..-2]
    else
        set fgcolor $argv[-1]
        set text $argv[1..-2]
    end

    printf '%s%s%s' (set_color -b $bgcolor $fgcolor) (string join " " $text) $__theme_reset_color_cache
end

# ============================================================================
# Main prompt function
# ============================================================================

function fish_prompt
    set -l sep (set_color $theme_prompt_segment_separator_color)$theme_prompt_segment_separator_char$__theme_reset_color_cache
    set -l line1 (string join "$sep" \
        (__theme_print_time) \
        (__theme_print_userhost) \
        (__theme_print_pwd) \
        (__theme_print_git_status) \
        (__theme_print_jobs) \
        (__theme_print_pwd_rw) \
        (__theme_print_battery_status) \
    )
    set -l line2 (string join " " \
        (__theme_print_virtualenv) \
        (print_colored $theme_prompt_char $theme_color_prompt) \
    )

    echo "$line1"
    echo -n "$line2 "
end
