function __theme_print_jobs
    [ "$theme_display_jobs" = 'no' ]; and return
    set -l num_jobs (jobs -l | command wc -l)

    if [ $num_jobs -gt 0 -o "$theme_display_jobs_always" = "yes" ]
        print_colored "$theme_prompt_status_jobs_char" $theme_color_status_prefix
        print_colored "$theme_prompt_status_separator_char" $theme_color_separator
        print_colored "$num_jobs" $theme_color_status_jobs
    end
end
