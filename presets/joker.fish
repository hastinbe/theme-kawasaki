# Joker preset
# Usage: kawasaki_preset joker
# Or source this file directly
#
# You can customize the color palette before loading:
#   set theme_primary 1eb980
#   set theme_secondary ffcf44
#   kawasaki_preset joker

# Default Joker color palette
set -q theme_primary; or set -g theme_primary 1eb980
set -q theme_secondary; or set -g theme_secondary ffcf44
set -q theme_primary_variant; or set -g theme_primary_variant 045d56
set -q theme_secondary_variant; or set -g theme_secondary_variant ff6859
set -q theme_hilight; or set -g theme_hilight b15dff

# Apply Joker theme colors
set -g theme_color_user $theme_hilight
set -g theme_color_host $theme_primary_variant
set -g theme_color_separator brblack
set -g theme_color_normal normal
set -g theme_color_time $theme_secondary_variant
set -g theme_color_path $theme_primary
set -g theme_color_prompt $theme_secondary_variant
set -g theme_color_virtualenv $theme_secondary
set -g theme_color_status_prefix $theme_hilight
set -g theme_color_status_jobs $theme_primary
set -g theme_color_status_rw $theme_primary
set -g theme_display_group no
set -g theme_prompt_segment_separator_color $theme_primary
set -g theme_prompt_userhost_separator '.'
set -g __fish_git_prompt_char_branch_begin '['
set -g __fish_git_prompt_char_branch_end ']'
set -g __fish_git_prompt_color_branch_begin brblack
set -g __fish_git_prompt_color_branch_end brblack
set -g __fish_git_prompt_color_branch $theme_secondary

set -gx fish_prompt_pwd_dir_length 1
set -g theme_display_jobs_always yes

