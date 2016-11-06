function __theme_print_pwd_rw
    [ "$theme_display_rw" = 'no' ]; and return;
    set -l rw_chars

    if [ -r . ]; set rw_chars r; end
    if [ -w . ]; set rw_chars $rw_chars"w"; end

    print_colored $theme_prompt_status_rw_char $theme_color_status_prefix
    print_colored $theme_prompt_status_separator_char $theme_color_separator
    print_colored $rw_chars $theme_color_status_rw
end
