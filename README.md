# kawasaki

`kawasaki` is a customizable [fish][fish] theme that emphasizes a simple and useful prompt without useless cluttter.

[![Oh My Fish](https://img.shields.io/badge/Framework-Oh_My_Fish-blue.svg?style=flat)](https://github.com/oh-my-fish/oh-my-fish)
[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](/LICENSE)

![kawasaki][screenshot]

#### Example customizations

| [Minimal Midnight](#customizing) | [Joker](#customizing) |
| -------------------------------- | --------------------- |
| ![midnight](https://user-images.githubusercontent.com/195790/96850333-45429a80-1489-11eb-8b28-043b2999b75d.png) | ![joker](https://user-images.githubusercontent.com/195790/96945002-0820eb80-150f-11eb-91fe-ecfa0e2b9131.png) |

## Installation


#### Requirements
* [Fish shell][fish] - a smart and user-friendly command line
shell for OS X, Linux, and the rest of the family
* [Oh My Fish][omf] - The Fishshell Framework

Once Oh My Fish is installed:

    omf install kawasaki

This theme was inspired by [bira][bira].

#### Notes

To use kawasaki's virtualenv prompt instead of the default virtualenv prompt append `set -x VIRTUAL_ENV_DISABLE_PROMPT 1` to your [init.fish][dotfiles]


## Features

 * Completely customizable.
 * Display status of the working tree for Git projects.
 * Read/write indicator of the current working directory.
 * Background jobs indicator.
 * Virtualenv prompt indicator.


## Customizing

#### Override defaults

You can override the default display settings by specifying any of the following settings in your [init.fish][dotfiles]:

```fish
## Enable the time to be displayed.
set -g theme_display_time yes

## Disable playing the user's current group.
set -g theme_display_group no

# Display the system hostname.
set -g theme_display_hostname no

## Disable Git-awareness.
set -g theme_display_git no

## Don't disable jobs indicator.
set -g theme_display_jobs no

## Always display the jobs indicator, even if there are no jobs.
set -g theme_display_jobs_always yes

## Hide the current directory read/write indicator.
set -g theme_display_rw no

## Don't display the VirtualEnv prompt.
set -g theme_display_virtualenv no

## Display the battery
set -g theme_display_batt no
set -g theme_display_batt_icon no
```

#### Look and feel

Nearly every aspect of kawasaki can be customized. The following can be set to adjust the look and feel of kawasaki:

```fish
set -g theme_color_error                           red
set -g theme_color_superuser                       red
set -g theme_color_user                            white
set -g theme_color_group                           666666
set -g theme_color_host                            brgreen
set -g theme_color_separator                       brblack
set -g theme_color_bracket                         brblue
set -g theme_color_normal                          normal
set -g theme_color_time                            666666
set -g theme_color_path                            brwhite
set -g theme_color_prompt                          white
set -g theme_color_virtualenv                      bryellow
set -g theme_color_status_prefix                   brblue
set -g theme_color_status_jobs                     brgreen
set -g theme_color_status_rw                       brwhite
set -g theme_color_batt_icon                       white
set -g theme_color_batt_charging                   brgreen
set -g theme_color_batt_discharging                red
set -g theme_color_batt_0                          red
set -g theme_color_batt_25                         red
set -g theme_color_batt_50                         bryellow
set -g theme_color_batt_75                         bryellow
set -g theme_color_batt_100                        brgreen

set -g theme_prompt_char_normal                    '$'
set -g theme_prompt_char_superuser                 '#'
set -g theme_prompt_char                           "$theme_prompt_char_normal"

set -g theme_prompt_superuser_glyph                \u2605
set -g theme_prompt_userhost_separator              '@'
set -g theme_prompt_group_separator                 ':'

set -g theme_prompt_segment_separator_char         ' '
set -g theme_prompt_segment_separator_color        normal

set -g theme_prompt_status_jobs_char               '%'
set -g theme_prompt_status_rw_char                 '.'
set -g theme_prompt_status_separator_char          '/'

set -g theme_prompt_virtualenv_char_begin          '('
set -g theme_prompt_virtualenv_char_end            ')'
set -g theme_prompt_virtualenv_color_char_begin    normal
set -g theme_prompt_virtualenv_color_char_end      normal

set -g theme_prompt_batt_charging_char             '↑'
set -g theme_prompt_batt_discharging_char          '↓'
set -g theme_prompt_batt_0                         ''
set -g theme_prompt_batt_25                        ''
set -g theme_prompt_batt_50                        ''
set -g theme_prompt_batt_75                        ''
set -g theme_prompt_batt_100                       ''

set -g theme_display_time_format                   '+%I:%M'

set -g __fish_git_prompt_color_merging             red
set -g __fish_git_prompt_color_branch              brblue
set -g __fish_git_prompt_showcolorhints            yes
set -g __fish_git_prompt_show_informative_status   yes
set -g __fish_git_prompt_char_stateseparator       ' '

set -g __fish_git_prompt_char_branch_begin         ''
set -g __fish_git_prompt_char_branch_end           ''
set -g __fish_git_prompt_color_branch_begin        bryellow
set -g __fish_git_prompt_color_branch_end          bryellow
```

##### Examples

__Minimal midnight__

![midnight](https://user-images.githubusercontent.com/195790/96850333-45429a80-1489-11eb-8b28-043b2999b75d.png)

```fish
set -gx fish_prompt_pwd_dir_length 0
set -g theme_display_group no
set -g theme_display_hostname no
set -g theme_color_user aa55ff
set -g theme_display_rw no
```

__Joker__

![joker](https://user-images.githubusercontent.com/195790/96945002-0820eb80-150f-11eb-91fe-ecfa0e2b9131.png)

```fish
set theme_primary                                   1eb980
set theme_secondary                                 ffcf44
set theme_primary_variant                           045d56
set theme_secondary_variant                         ff6859
set theme_hilight                                   b15dff

set -g theme_color_user                             $theme_hilight
set -g theme_color_host                             $theme_primary_variant
set -g theme_color_separator                        brblack
set -g theme_color_normal                           normal
set -g theme_color_time                             $theme_secondary_variant
set -g theme_color_path                             $theme_primary
set -g theme_color_prompt                           $theme_secondary_variant
set -g theme_color_virtualenv                       $theme_secondary
set -g theme_color_status_prefix                    $theme_hilight
set -g theme_color_status_jobs                      $theme_primary
set -g theme_color_status_rw                        $theme_primary
set -g theme_display_group                          no
set -g theme_prompt_segment_separator_color         $theme_primary
set -g theme_prompt_userhost_separator              '.'
set -g __fish_git_prompt_char_branch_begin          '['
set -g __fish_git_prompt_char_branch_end            ']'
set -g __fish_git_prompt_color_branch_begin         brblack
set -g __fish_git_prompt_color_branch_end           brblack
set -g __fish_git_prompt_color_branch               $theme_secondary

set -gx fish_prompt_pwd_dir_length                  1
set -g theme_display_jobs_always                    yes
```

## License

kawasaki is released under [The MIT License (MIT)][license]

Copyright (c) 2016 Beau Hastings

[license]:    /LICENSE
[fish]:       https://github.com/fish-shell/fish-shell
[omf]:        https://github.com/oh-my-fish/oh-my-fish
[screenshot]: https://cloud.githubusercontent.com/assets/195790/20061473/9545bd4c-a4c5-11e6-83da-8b0a954b8a5a.gif
[bira]:       https://github.com/oh-my-fish/theme-bira
[dotfiles]:   https://github.com/oh-my-fish/oh-my-fish#dotfiles
