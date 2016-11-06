function __theme_print_userhost
    echo -ns (__theme_print_superuser) $USER (__theme_reset_color)

    if [ "$theme_display_group" != 'no' ]
        print_colored $theme_prompt_userhost_separator $theme_color_separator
        print_colored (id -gn) $theme_color_group 
    end

    set -l hostname (command hostname | cut -d '.' -f 1)

    print_colored "@" $theme_color_separator
    print_colored "$hostname" $theme_color_host
end
