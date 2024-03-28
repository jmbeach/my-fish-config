function foreach --description 'Perform a command on each line of stdout' --argument cmd
    if test -z "$cmd"
        echo "Command is required" >&2
        return 1
    end
    while read -l line
        eval $cmd $line
    end
end
