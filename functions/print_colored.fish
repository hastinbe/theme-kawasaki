function print_colored
    set -l bgcolor normal
    set -l fgcolor normal
    set -l text

    if contains -- -b in $argv[1]
        set bgcolor $argv[2]
        set fgcolor $argv[-1]
        set text $argv[3..-2]
    else
        set fgcolor $argv[-1]
        set text $argv[1..-2]
    end

    printf '%s%s%s' (set_color -b $bgcolor $fgcolor) (string join " " $text) (__theme_reset_color)
end
