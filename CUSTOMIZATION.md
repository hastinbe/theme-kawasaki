# Customization Guide

This guide covers all the customization options available in the kawasaki theme.

## Display Options

You can control which segments are displayed in the prompt:

```fish
## Enable the time to be displayed.
set -g theme_display_time yes

## Disable playing the user's current group.
set -g theme_display_group no

# Display the system hostname.
set -g theme_display_hostname no

## Disable Git-awareness.
set -g theme_display_git no

## Don't disable jobs indicator.
set -g theme_display_jobs no

## Always display the jobs indicator, even if there are no jobs.
set -g theme_display_jobs_always yes

## Hide the current directory read/write indicator.
set -g theme_display_rw no

## Don't display the VirtualEnv prompt.
set -g theme_display_virtualenv no

## Display the battery
set -g theme_display_batt no
set -g theme_display_batt_icon no
```

## Color Customization

Nearly every aspect of kawasaki can be customized. The following can be set to adjust the look and feel:

### Basic Colors

```fish
set -g theme_color_error                           red
set -g theme_color_superuser                       red
set -g theme_color_user                            white
set -g theme_color_group                           666666
set -g theme_color_host                            brgreen
set -g theme_color_separator                       brblack
set -g theme_color_bracket                         brblue
set -g theme_color_normal                          normal
```

### Prompt Element Colors

```fish
set -g theme_color_time                            666666
set -g theme_color_path                            brwhite
set -g theme_color_prompt                          white
set -g theme_color_virtualenv                      bryellow
```

### Status Indicator Colors

```fish
set -g theme_color_status_prefix                   brblue
set -g theme_color_status_jobs                     brgreen
set -g theme_color_status_rw                       brwhite
```

### Battery Colors

```fish
set -g theme_color_batt_icon                       white
set -g theme_color_batt_charging                   brgreen
set -g theme_color_batt_discharging                red
set -g theme_color_batt_0                          red
set -g theme_color_batt_25                         red
set -g theme_color_batt_50                         bryellow
set -g theme_color_batt_75                         bryellow
set -g theme_color_batt_100                        brgreen
```

## Prompt Character Customization

### Basic Prompt Characters

```fish
set -g theme_prompt_char_normal                    '$'
set -g theme_prompt_char_superuser                 '#'
set -g theme_prompt_char                           "$theme_prompt_char_normal"
set -g theme_prompt_superuser_glyph                \u2605
```

### Separators

```fish
set -g theme_prompt_userhost_separator              '@'
set -g theme_prompt_group_separator                 ':'
set -g theme_prompt_segment_separator_char          ' '
set -g theme_prompt_segment_separator_color        normal
set -g theme_prompt_status_separator_char          '/'
```

### Status Indicators

```fish
set -g theme_prompt_status_jobs_char               '%'
set -g theme_prompt_status_rw_char                 '.'
```

### Virtualenv

```fish
set -g theme_prompt_virtualenv_char_begin          '('
set -g theme_prompt_virtualenv_char_end             ')'
set -g theme_prompt_virtualenv_color_char_begin     normal
set -g theme_prompt_virtualenv_color_char_end       normal
```

### Battery Symbols

```fish
set -g theme_prompt_batt_charging_char              '↑'
set -g theme_prompt_batt_discharging_char           '↓'
set -g theme_prompt_batt_0                          ''
set -g theme_prompt_batt_25                         ''
set -g theme_prompt_batt_50                         ''
set -g theme_prompt_batt_75                         ''
set -g theme_prompt_batt_100                        ''
```

## Format Settings

```fish
set -g theme_display_time_format                   '+%I:%M'
```

## Git Prompt Settings

```fish
set -g __fish_git_prompt_color_merging             red
set -g __fish_git_prompt_color_branch              brblue
set -g __fish_git_prompt_showcolorhints            yes
set -g __fish_git_prompt_show_informative_status   yes
set -g __fish_git_prompt_char_stateseparator       ' '

# Unofficial fish_git_prompt settings
set -g __fish_git_prompt_char_branch_begin         ''
set -g __fish_git_prompt_char_branch_end           ''
set -g __fish_git_prompt_color_branch_begin        bryellow
set -g __fish_git_prompt_color_branch_end         bryellow
```

## Path Display

Control how the current directory path is displayed:

```fish
# Show full path
set -e fish_prompt_pwd_dir_length

# Show only last directory
set -gx fish_prompt_pwd_dir_length 1

# Show only directory name (no path)
set -gx fish_prompt_pwd_dir_length 0
```

## Examples

### Minimal Midnight

```fish
set -gx fish_prompt_pwd_dir_length 0
set -g theme_display_group no
set -g theme_display_hostname no
set -g theme_color_user aa55ff
set -g theme_display_rw no
set -g theme_display_jobs no
```

### Joker (Manual Configuration)

```fish
set theme_primary                                   1eb980
set theme_secondary                                 ffcf44
set theme_primary_variant                           045d56
set theme_secondary_variant                         ff6859
set theme_hilight                                   b15dff

set -g theme_color_user                             $theme_hilight
set -g theme_color_host                             $theme_primary_variant
set -g theme_color_separator                        brblack
set -g theme_color_normal                           normal
set -g theme_color_time                             $theme_secondary_variant
set -g theme_color_path                             $theme_primary
set -g theme_color_prompt                           $theme_secondary_variant
set -g theme_color_virtualenv                       $theme_secondary
set -g theme_color_status_prefix                   $theme_hilight
set -g theme_color_status_jobs                      $theme_primary
set -g theme_color_status_rw                        $theme_primary
set -g theme_display_group                          no
set -g theme_prompt_segment_separator_color         $theme_primary
set -g theme_prompt_userhost_separator              '.'
set -g __fish_git_prompt_char_branch_begin          '['
set -g __fish_git_prompt_char_branch_end            ']'
set -g __fish_git_prompt_color_branch_begin         brblack
set -g __fish_git_prompt_color_branch_end           brblack
set -g __fish_git_prompt_color_branch               $theme_secondary

set -gx fish_prompt_pwd_dir_length                  1
set -g theme_display_jobs_always                    yes
```

## Creating Custom Presets

See the main README for instructions on creating custom presets using the preset system.

