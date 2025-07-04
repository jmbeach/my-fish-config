function layout_get_height_adjustment
    set id_active_window $(xdotool getactivewindow)
    set class_name_active_window $(xprop -id $id_active_window WM_CLASS | cut -d '"' -f2)
    if test "$class_name_active_window" = brave-browser
        echo 66
    else
        echo 0
    end
end
