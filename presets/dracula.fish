# Dracula preset
# Usage: kawasaki_preset dracula
# Based on the popular Dracula color scheme
# https://draculatheme.com/

# Dracula color palette
set -q theme_primary; or set -g theme_primary bd93f9  # Purple
set -q theme_secondary; or set -g theme_secondary 50fa7b  # Green
set -q theme_primary_variant; or set -g theme_primary_variant ff79c6  # Pink
set -q theme_secondary_variant; or set -g theme_secondary_variant ffb86c  # Orange
set -q theme_hilight; or set -g theme_hilight 8be9fd  # Cyan

# Apply Dracula theme colors
set -g theme_color_user $theme_hilight
set -g theme_color_host $theme_primary
set -g theme_color_separator brblack
set -g theme_color_normal normal
set -g theme_color_time 6272a4  # Comment (muted purple)
set -g theme_color_path $theme_secondary
set -g theme_color_prompt $theme_primary
set -g theme_color_virtualenv $theme_secondary_variant
set -g theme_color_status_prefix $theme_hilight
set -g theme_color_status_jobs $theme_secondary
set -g theme_color_status_rw $theme_primary_variant
set -g theme_prompt_segment_separator_color $theme_primary
set -g theme_prompt_userhost_separator '@'
set -g __fish_git_prompt_color_branch $theme_secondary

# Vibrant, feature-rich display - always show jobs, hide group for cleaner look
set -g theme_display_time yes
set -g theme_display_group no
set -g theme_display_hostname yes
set -g theme_display_git yes
set -g theme_display_jobs_always yes
set -g theme_display_rw yes
set -g theme_display_virtualenv yes
set -gx fish_prompt_pwd_dir_length 1

