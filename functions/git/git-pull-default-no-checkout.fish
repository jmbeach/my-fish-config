function git-pull-default-no-checkout --description 'Pull default git branch without checking it out'
    set -l branch_name $(git-get-default-branch)
    git fetch origin $branch_name:$branch_name
end
