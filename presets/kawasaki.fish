# Default Kawasaki preset
# Usage: kawasaki_preset kawasaki
# Or source this file directly
#
# This resets all theme variables to their default values

# Reset color palette variables
set -e theme_primary
set -e theme_secondary
set -e theme_primary_variant
set -e theme_secondary_variant
set -e theme_hilight

# Reset to default colors (these will use __default_var defaults if not set)
set -e theme_color_error
set -e theme_color_superuser
set -e theme_color_user
set -e theme_color_group
set -e theme_color_host
set -e theme_color_separator
set -e theme_color_bracket
set -e theme_color_normal
set -e theme_color_time
set -e theme_color_path
set -e theme_color_prompt
set -e theme_color_virtualenv
set -e theme_color_status_prefix
set -e theme_color_status_jobs
set -e theme_color_status_rw
set -e theme_color_batt_icon
set -e theme_color_batt_charging
set -e theme_color_batt_discharging
set -e theme_color_batt_0
set -e theme_color_batt_25
set -e theme_color_batt_50
set -e theme_color_batt_75
set -e theme_color_batt_100

# Reset prompt characters
set -e theme_prompt_char_normal
set -e theme_prompt_char_superuser
set -e theme_prompt_char
set -e theme_prompt_superuser_glyph
set -e theme_prompt_userhost_separator
set -e theme_prompt_group_separator
set -e theme_prompt_segment_separator_char
set -e theme_prompt_segment_separator_color
set -e theme_prompt_status_jobs_char
set -e theme_prompt_status_rw_char
set -e theme_prompt_status_separator_char
set -e theme_prompt_virtualenv_char_begin
set -e theme_prompt_virtualenv_char_end
set -e theme_prompt_virtualenv_color_char_begin
set -e theme_prompt_virtualenv_color_char_end
set -e theme_prompt_batt_charging_char
set -e theme_prompt_batt_discharging_char
set -e theme_prompt_batt_0
set -e theme_prompt_batt_25
set -e theme_prompt_batt_50
set -e theme_prompt_batt_75
set -e theme_prompt_batt_100

# Reset display settings
set -e theme_display_time_format

# Reset git prompt settings
set -e __fish_git_prompt_color_merging
set -e __fish_git_prompt_color_branch
set -e __fish_git_prompt_showcolorhints
set -e __fish_git_prompt_show_informative_status
set -e __fish_git_prompt_char_stateseparator
set -e __fish_git_prompt_char_branch_begin
set -e __fish_git_prompt_char_branch_end
set -e __fish_git_prompt_color_branch_begin
set -e __fish_git_prompt_color_branch_end

# Reset fish_prompt_pwd_dir_length to default (unlimited)
set -e fish_prompt_pwd_dir_length

# Note: Display toggles (theme_display_*) are not reset here
# as users may want to keep their display preferences

