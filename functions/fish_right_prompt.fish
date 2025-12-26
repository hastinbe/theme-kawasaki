function fish_right_prompt
    if test $status -ne 0
        # Use cached reset color if available, otherwise fall back to direct call
        if not set -q __theme_reset_color_cache
            # Ensure theme_color_normal is valid before using it
            set -q theme_color_normal; or set -g theme_color_normal normal
            if test -z "$theme_color_normal" -o "$theme_color_normal" = "~"
                set -g theme_color_normal normal
            end
            set -g __theme_reset_color_cache (set_color $theme_color_normal)
        end
        echo -n (set_color $theme_color_error) ↵ $status$__theme_reset_color_cache
    end
end
