# Source - https://stackoverflow.com/a/750182
# Posted by Pat Notz, modified by community. See post 'Timeline' for change history
# Retrieved 2026-09-20, License - CC BY-SA 4.0

#!/bin/sh

git filter-branch --env-filter '
OLD_EMAIL="m.roth@uea.ac.uk"
CORRECT_NAME="mroth-mathse"
CORRECT_EMAIL="272444097+mroth-maths@users.noreply.github.com"
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
