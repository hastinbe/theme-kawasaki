function fish_right_prompt
    if test $status -ne 0
        # Use cached reset color if available, otherwise fall back to direct call
        set -q __theme_reset_color_cache; or set -g __theme_reset_color_cache (set_color $theme_color_normal)
        echo -n (set_color $theme_color_error) ↵ $status$__theme_reset_color_cache
    end
end
