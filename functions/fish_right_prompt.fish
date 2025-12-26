function fish_right_prompt
    if test $status -ne 0
        echo -n (set_color $theme_color_error) ↵ $status(set_color $theme_color_normal)
    end
end
