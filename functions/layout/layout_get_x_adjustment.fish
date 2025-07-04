function layout_get_x_adjustment
    set id_active_window $(xdotool getactivewindow)
    set class_name_active_window $(xprop -id $id_active_window WM_CLASS | cut -d '"' -f2)
    if test "$class_name_active_window" = brave-browser
        echo -13
    else
        echo 0
    end
end
