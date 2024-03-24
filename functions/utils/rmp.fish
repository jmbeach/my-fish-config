function rmp --description 'Remove a directory using xargs to do parallel deletes (faster)'
    set -l directory $argv[1]
    if test -z "$directory"
        echo "Error: Please provide a path to delete" >&2
        return 1
    end
    if test "$directory" = /
        echo 'Error: Cannot delete root directory'
        return 1
    end
    if test ! -d $directory
        echo "Error: Folder not found: $directory"
        return 1
    end

    echo "Deleting files under '$directory' in parallel"
    find "$directory" -type f -print0 | parallel -0 rm
    echo "Deleting empty folder"
    rm -rf "$directory"
end
