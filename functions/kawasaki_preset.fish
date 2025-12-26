#!/usr/bin/fish
#
# kawasaki preset loader
#
# Usage: kawasaki_preset <preset_name>
#
# Dynamically discovers available presets from the presets directory

function kawasaki_preset -d "Load a kawasaki theme preset"
    # Parse arguments
    set -l save_to_config false
    set -l verbose_mode false
    set -l preset_name

    # Check for flags
    for arg in $argv
        switch $arg
            case --save -s
                set save_to_config true
            case --verbose -v
                set verbose_mode true
            case --help -h
                echo "Usage: kawasaki_preset [--save|-s] [--verbose|-v] <preset_name>"
                echo ""
                echo "Options:"
                echo "  --save, -s      Save preset to fish config file for persistence"
                echo "  --verbose, -v   Show output messages (quiet by default)"
                echo "  --help, -h      Show this help message"
                return 0
            case '*'
                if test -z "$preset_name"
                    set preset_name (string lower $arg)
                end
        end
    end

    # Find presets directory
    set -l function_file (status -f)
    set -l preset_dir (command dirname $function_file)/../presets

    # Also try OMF path if the relative path doesn't exist
    if not test -d "$preset_dir"
        if test -n "$OMF_PATH"
            set preset_dir $OMF_PATH/themes/kawasaki/presets
        end
    end

    # Discover available presets from presets directory
    set -l available_presets
    if test -d "$preset_dir"
        for preset_file in $preset_dir/*.fish
            set -l basename (command basename $preset_file .fish)
            set -a available_presets $basename
        end
    end

    # Add built-in presets that don't require files
    set -a available_presets custom

    if test -z "$preset_name"
        echo "Usage: kawasaki_preset [--save|-s] <preset_name>"
        echo ""
        echo "Options:"
        echo "  --save, -s    Save preset to fish config file for persistence"
        echo ""
        echo ""
        echo "Available presets:"
        for preset in $available_presets
            echo "  $preset"
        end
        echo "  default   - Alias for kawasaki (default preset)"
        return 1
    end

    # Load preset file if it exists
    set -l preset_file $preset_dir/$preset_name.fish

    if test -f "$preset_file"
        # Reset all theme variables before loading new preset
        __kawasaki_reset_theme_variables

        # Reinitialize all defaults before loading preset
        # (presets rely on defaults from fish_prompt.fish)
        __kawasaki_reinitialize_defaults

        source "$preset_file"

        if test "$verbose_mode" = true
            echo "Loaded preset: $preset_name"
        end
        # Reinitialize cache after preset change (ensure theme_color_normal is valid)
        set -q theme_color_normal; or set -g theme_color_normal normal
        set -g __theme_reset_color_cache (set_color $theme_color_normal)

        # Save to config if requested
        if test "$save_to_config" = true
            __kawasaki_save_preset_to_config $preset_name $verbose_mode
        end
        return 0
    end

    # Handle built-in presets that don't have files
    switch $preset_name
        case default kawasaki
            # Reset all theme variables before loading default
            __kawasaki_reset_theme_variables

            # Reinitialize all defaults
            __kawasaki_reinitialize_defaults

            # Load default preset file if it exists, otherwise variables are already reset
            if test -f "$preset_file"
                source "$preset_file"
                set preset_name kawasaki
            else
                set preset_name default
            end

            if test "$verbose_mode" = true
                echo "Loaded preset: $preset_name"
            end

            # Save to config if requested
            if test "$save_to_config" = true
                __kawasaki_save_preset_to_config $preset_name $verbose_mode
            end

        case custom
            # Reset all theme variables before applying custom palette
            __kawasaki_reset_theme_variables

            # Reinitialize all defaults
            __kawasaki_reinitialize_defaults

            # Apply custom palette if variables are set
            if set -q theme_primary
                set -g theme_color_path $theme_primary
                set -g theme_color_status_jobs $theme_primary
                set -g theme_color_status_rw $theme_primary
                set -g theme_prompt_segment_separator_color $theme_primary
            end
            if set -q theme_secondary
                set -g theme_color_virtualenv $theme_secondary
                set -q __fish_git_prompt_color_branch; and set -g __fish_git_prompt_color_branch $theme_secondary
            end
            if set -q theme_primary_variant
                set -g theme_color_host $theme_primary_variant
            end
            if set -q theme_secondary_variant
                set -g theme_color_time $theme_secondary_variant
                set -g theme_color_prompt $theme_secondary_variant
            end
            if set -q theme_hilight
                set -g theme_color_user $theme_hilight
                set -g theme_color_status_prefix $theme_hilight
            end
            if test "$verbose_mode" = true
                echo "Applied custom color palette"
            end

            # Save to config if requested
            if test "$save_to_config" = true
                __kawasaki_save_preset_to_config custom $verbose_mode
            end

        case '*'
            echo "Unknown preset: $preset_name"
            echo "Available presets:"
            for preset in $available_presets
                echo "  $preset"
            end
            echo "  default   - Alias for kawasaki (default preset)"
            return 1
    end

    # Ensure theme_color_normal is set before reinitializing cache
    set -q theme_color_normal; or set -g theme_color_normal normal

    # Reinitialize cache after preset change
    set -g __theme_reset_color_cache (set_color $theme_color_normal)
end

# Helper function to reinitialize all default theme variables
# This ensures presets have access to all defaults from fish_prompt.fish
function __kawasaki_reinitialize_defaults -d "Reinitialize all default theme variables"
    if not functions -q __default_var
        return
    end

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

    # Prompt character definitions
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
    __default_var theme_prompt_virtualenv_color_char_end        normal

    # Battery symbols
    __default_var theme_prompt_batt_charging_char              '↑'
    __default_var theme_prompt_batt_discharging_char           '↓'
    __default_var theme_prompt_batt_0                          ''
    __default_var theme_prompt_batt_25                         ''
    __default_var theme_prompt_batt_50                         ''
    __default_var theme_prompt_batt_75                         ''
    __default_var theme_prompt_batt_100                        ''

    # Display format settings
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
    __default_var __fish_git_prompt_color_branch_end           bryellow
end

# Helper function to reset all theme variables to defaults
function __kawasaki_reset_theme_variables -d "Reset all theme variables to allow clean preset loading"
    # Save theme_color_normal before reset (it's critical for cache)
    # Always ensure we have a valid value
    set -l saved_normal normal
    if set -q theme_color_normal
        if test -n "$theme_color_normal" -a "$theme_color_normal" != "~"
            set saved_normal $theme_color_normal
        end
    end

    # Reset color palette variables
    set -e theme_primary
    set -e theme_secondary
    set -e theme_primary_variant
    set -e theme_secondary_variant
    set -e theme_hilight

    # Reset all theme color variables (they will use __default_var defaults if not set)
    # Don't unset theme_color_normal - restore it immediately
    set -e theme_color_error
    set -e theme_color_superuser
    set -e theme_color_user
    set -e theme_color_group
    set -e theme_color_host
    set -e theme_color_separator
    set -e theme_color_bracket
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

    # Reset prompt character variables
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

    # Reset display format settings
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

    # Reset fish_prompt_pwd_dir_length
    set -e fish_prompt_pwd_dir_length

    # Reset display toggles so each preset starts with a clean slate
    # This ensures presets don't inherit display settings from previous presets
    # If unset, they use default behavior (usually show)
    set -e theme_display_time
    set -e theme_display_group
    set -e theme_display_hostname
    set -e theme_display_git
    set -e theme_display_jobs
    set -e theme_display_jobs_always
    set -e theme_display_rw
    set -e theme_display_virtualenv
    set -e theme_display_batt
    set -e theme_display_batt_icon

    # Always ensure theme_color_normal is set (critical for cache initialization)
    # Restore saved value (which is always valid)
    set -g theme_color_normal $saved_normal
end

# Helper function to save preset to fish config file
function __kawasaki_save_preset_to_config -d "Save preset command to fish config file"
    set -l preset_name $argv[1]
    set -l verbose_mode $argv[2]
    set -l config_file ~/.config/fish/config.fish

    # Create config directory if it doesn't exist
    set -l config_dir (command dirname $config_file)
    if not test -d "$config_dir"
        command mkdir -p "$config_dir"
    end

    # Create config file if it doesn't exist
    if not test -f "$config_file"
        command touch "$config_file"
    end

    # Check if kawasaki_preset is already in the config
    set -l existing_line (command grep -n "kawasaki_preset" "$config_file" 2>/dev/null | command head -1)

    if test -n "$existing_line"
        # Replace existing line
        set -l line_num (echo $existing_line | command cut -d: -f1)
        set -l command_to_add "kawasaki_preset $preset_name"

        # Use sed to replace the line (works on both Linux and macOS)
        if command -v sed >/dev/null
            # Escape special characters in the replacement string for sed
            set -l escaped_command (echo "$command_to_add" | command sed 's/[[\.*^$()+?{|]/\\&/g')
            # Build sed command with proper quoting
            set -l sed_expr "$line_num"c\\"$escaped_command"
            if test (uname) = Darwin
                command sed -i '' -e $sed_expr "$config_file"
            else
                command sed -i -e $sed_expr "$config_file"
            end
            if test "$verbose_mode" = true
                echo "Updated preset in $config_file"
            end
        else
            echo "Warning: Could not update config file (sed not found)"
        end
    else
        # Append new line
        echo "" >> "$config_file"
        echo "# kawasaki theme preset" >> "$config_file"
        echo "kawasaki_preset $preset_name" >> "$config_file"
        if test "$verbose_mode" = true
            echo "Saved preset to $config_file"
        end
    end
end
