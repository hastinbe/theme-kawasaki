function fish_right_prompt
    set -l st $status

    if test $status -ne 0
        echo -n (set_color $theme_color_error) ↵ $st(set_color $theme_color_normal)
    end
end
