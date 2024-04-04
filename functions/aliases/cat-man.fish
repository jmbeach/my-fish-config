function cat-man --description 'Gets the output of a man entry as plain text' --argument entry
    if test -z $entry
        echo "Entry argument is required" >&2
        return 1
    end
    man $entry | col -b | cat
end
