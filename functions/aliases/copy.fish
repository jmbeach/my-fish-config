function copy
    switch (uname)
        case Linux
            command xclip -selection clipboard $argv
        case Darwin
            command pbcopy $argv
        case '*'
            echo "OS $(uname) is not handled" >&2
    end
end
