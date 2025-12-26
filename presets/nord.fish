# Nord preset
# Usage: kawasaki_preset nord
# Based on the popular Nord color scheme (arctic, north-bluish)
# https://www.nordtheme.com/

# Nord color palette
set -q theme_primary; or set -g theme_primary 88c0d0  # Frost (light blue)
set -q theme_secondary; or set -g theme_secondary a3be8c  # Aurora (green)
set -q theme_primary_variant; or set -g theme_primary_variant 5e81ac  # Polar Night (blue)
set -q theme_secondary_variant; or set -g theme_secondary_variant b48ead  # Aurora (purple)
set -q theme_hilight; or set -g theme_hilight 81a1c1  # Frost (blue)

# Apply Nord theme colors
set -g theme_color_user $theme_hilight
set -g theme_color_host $theme_primary_variant
set -g theme_color_separator brblack
set -g theme_color_normal normal
set -g theme_color_time 4c566a  # Snow Storm (gray)
set -g theme_color_path $theme_primary
set -g theme_color_prompt $theme_primary
set -g theme_color_virtualenv $theme_secondary
set -g theme_color_status_prefix $theme_hilight
set -g theme_color_status_jobs $theme_secondary
set -g theme_color_status_rw $theme_primary
set -g theme_prompt_segment_separator_color $theme_primary_variant
set -g theme_prompt_userhost_separator '@'
set -g __fish_git_prompt_color_branch $theme_secondary

# Professional, informative display - show everything
set -g theme_display_time yes
set -g theme_display_group yes
set -g theme_display_hostname yes
set -g theme_display_git yes
set -g theme_display_jobs yes
set -g theme_display_rw yes
set -g theme_display_virtualenv yes
set -gx fish_prompt_pwd_dir_length 1

