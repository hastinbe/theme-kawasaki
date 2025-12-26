# Gruvbox preset
# Usage: kawasaki_preset gruvbox
# Based on the popular Gruvbox color scheme (retro, warm)
# https://github.com/morhetz/gruvbox

# Gruvbox color palette
set -q theme_primary; or set -g theme_primary 83a598  # Aqua
set -q theme_secondary; or set -g theme_secondary b8bb26  # Green
set -q theme_primary_variant; or set -g theme_primary_variant d3869b  # Purple
set -q theme_secondary_variant; or set -g theme_secondary_variant fe8019  # Orange
set -q theme_hilight; or set -g theme_hilight fabd2f  # Yellow

# Apply Gruvbox theme colors
set -g theme_color_user $theme_hilight
set -g theme_color_host $theme_primary_variant
set -g theme_color_separator brblack
set -g theme_color_normal normal
set -g theme_color_time 928374  # Gray (dim)
set -g theme_color_path $theme_primary
set -g theme_color_prompt $theme_secondary
set -g theme_color_virtualenv $theme_secondary_variant
set -g theme_color_status_prefix $theme_hilight
set -g theme_color_status_jobs $theme_secondary
set -g theme_color_status_rw $theme_primary
set -g theme_prompt_segment_separator_color $theme_primary_variant
set -g theme_prompt_userhost_separator '@'
set -g __fish_git_prompt_color_branch $theme_secondary

# Retro, minimal display - hide time and group, show essential info
set -g theme_display_time no
set -g theme_display_group no
set -g theme_display_hostname yes
set -g theme_display_git yes
set -g theme_display_jobs yes
set -g theme_display_rw no
set -g theme_display_virtualenv yes
set -gx fish_prompt_pwd_dir_length 1

