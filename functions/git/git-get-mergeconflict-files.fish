function git-get-mergeconflict-files --description 'Get names of git merge conflict files'
    git diff --name-only --diff-filter=U --relative | cat
end
