function __theme_print_superuser
    if [ (command id -u) = "0" ]
        set theme_prompt_char "$theme_prompt_char_superuser"
        print_colored $theme_prompt_superuser_glyph $theme_color_superuser
    else
        set theme_prompt_char "$theme_prompt_char_normal"
    end
end
