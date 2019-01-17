#!/usr/bin/env dash

GREY_COLOR="#606060"

i3_print_color()
{
    if [ $# -ne 2 ]
    then
        return 1
    fi

    TEXT="$1"
    COLOR="$2"

    echo "<span foreground=\"$COLOR\">$TEXT</span>"
    return 0
}

CURRENT_MUSIC="$(mpc current --format "%artist%: %title%")"
MUSIC_STATE="$(mpc | grep -Eo "\[.+\]")"

case "$MUSIC_STATE" in
    "[paused]")
        i3_print_color "$CURRENT_MUSIC" "$GREY_COLOR" ;;

    "[playing]")
        echo "$CURRENT_MUSIC" ;;
esac
