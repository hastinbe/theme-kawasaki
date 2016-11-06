function __theme_print_time
    [ "$theme_display_time" = 'yes' ]; or return;
    print_colored (command date $theme_display_time_format) $theme_color_time
end
