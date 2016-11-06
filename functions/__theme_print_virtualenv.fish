function __theme_print_virtualenv
    [ "$theme_display_virtualenv" = 'no' -o -z "$VIRTUAL_ENV" ]; and return
    
    set -l basename (basename "$VIRTUAL_ENV")

    # special case for Aspen magic directories (http://www.zetadev.com/software/aspen/)
    if test "$basename" = "__"
        set basename (basename (dirname "$VIRTUAL_ENV"))
    end

    print_colored $theme_prompt_virtualenv_char_begin $theme_prompt_virtualenv_color_char_begin
    print_colored $basename $theme_color_virtualenv
    print_colored $theme_prompt_virtualenv_char_end $theme_prompt_virtualenv_color_char_end
end
