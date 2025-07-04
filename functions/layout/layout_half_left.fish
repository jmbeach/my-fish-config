function layout_half_left
    set -l geometry $(xdotool getdisplaygeometry)
    set -l width $(echo $geometry | cut -d ' ' -f1)
    set -l height $(echo $geometry | cut -d ' ' -f2)

    set -l margin_x $LAYOUT_MARGIN_X
    # adjust the x margin
    set -l adjustment_x $(layout_get_x_adjustment)
    set -l margin_x (math "$margin_x + $adjustment_x")
    # set x to the end of the x margin
    set -l position_x $margin_x

    set -l margin_y_top $LAYOUT_MARGIN_Y_TOP
    set -l adjustment_y $(layout_get_y_adjustment)
    set -l margin_y_top (math "$margin_y_top + $adjustment_y")
    # set y to the end of the y margin
    set -l position_y $margin_y_top

    # remove y margins from height
    set -l height (math "$height - $margin_y_top")
    set -l height (math "$height - $LAYOUT_MARGIN_Y_BOT")
    set -l adjustment_height $(layout_get_height_adjustment)
    set -l height (math "$height + $adjustment_height")

    # remove x margin from width
    set -l width (math "$width / 2")
    set -l width (math "$width - $margin_x")
    set -l width (math "$width - ($margin_x / 2)")

    # adjust the width
    set -l adjustment_width $(layout_get_width_adjustment)
    set -l width (math "$width + $adjustment_width")

    set -l current_window (xdotool getactivewindow)
    # notify-send "x: [$position_x], y: [$position_y], width: [$width], height: [$height]"
    xdotool windowmove "$current_window" "$position_x" "$position_y" windowsize "$current_window" "$width" "$height"
end
