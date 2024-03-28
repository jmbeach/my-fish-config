function git-get-default-branch --description 'Get the default (main / master) branch of git repo'
    git remote show origin | sed -n '/HEAD branch/s/.*: //p'
end
