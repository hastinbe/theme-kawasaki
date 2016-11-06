function __theme_print_git_status
    [ "$theme_display_git" = 'no' ]; and return
    set -l git_prompt (__fish_git_prompt | command sed -e 's/^ (//' -e 's/)$//')

    [ "$git_prompt" = "" ]; and return

    print_colored $__fish_git_prompt_char_branch_begin $__fish_git_prompt_color_branch_begin
    printf '%s' $git_prompt
    print_colored $__fish_git_prompt_char_branch_end $__fish_git_prompt_color_branch_end
end
