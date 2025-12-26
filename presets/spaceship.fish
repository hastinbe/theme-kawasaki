# Spaceship preset
# Usage: kawasaki_preset spaceship
# Minimal, clean prompt inspired by Spaceship prompt
# Shows only essential information with clean separators

# Spaceship-inspired color palette (subtle, professional)
set -q theme_primary; or set -g theme_primary 00d4aa  # Cyan
set -q theme_secondary; or set -g theme_secondary ffc58e  # Yellow
set -q theme_primary_variant; or set -g theme_primary_variant 6c6c6c  # Gray
set -q theme_secondary_variant; or set -g theme_secondary_variant ff6b6b  # Red
set -q theme_hilight; or set -g theme_hilight 4ec9b0  # Bright cyan

# Apply Spaceship theme colors
set -g theme_color_user $theme_hilight
set -g theme_color_host $theme_primary_variant
set -g theme_color_separator brblack
set -g theme_color_normal normal
set -g theme_color_time 6c6c6c  # Gray
set -g theme_color_path $theme_primary
set -g theme_color_prompt $theme_primary
set -g theme_color_virtualenv $theme_secondary
set -g theme_color_status_prefix $theme_hilight
set -g theme_color_status_jobs $theme_secondary
set -g theme_color_status_rw $theme_primary
set -g theme_prompt_segment_separator_color normal
set -g theme_prompt_userhost_separator '@'
set -g __fish_git_prompt_color_branch $theme_secondary

# Minimal, clean display - only essential information
set -g theme_display_time no
set -g theme_display_group no
set -g theme_display_hostname yes
set -g theme_display_git yes
set -g theme_display_jobs yes
set -g theme_display_rw no
set -g theme_display_virtualenv yes
set -gx fish_prompt_pwd_dir_length 1

