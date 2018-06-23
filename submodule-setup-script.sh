#!/bin/bash

# echo "Deleting contents of .gitmodule file"
#
# > .gitmodules
#
# echo "Staging changes to .gitmodules"
#
# git add .gitmodules

echo "Now delete the relevant section to the submodule from the .git/config file. Specifically, this portion"

echo '[submodule "public"]
    url = git@github.com:commonplaceworld/commonplaceworld.github.io.git
    active = true"'

echo "Type anything when done. Note: If you just cloned the repo, this step isn't necessary"

read varname

echo "OK"

echo "Deleting the public ref"

git rm --cached public

echo "Deleting the .git/modules/public"
rm -rf .git/modules/public

echo "Commiting changes"
git commit -m "Removed submodule "

echo "Removing the public directory"
rm -rf public

echo "Now let's start fresh"

echo "Adding the commonplace.world submodule to public"

git submodule add -b master git@github.com:commonplaceworld/commonplaceworld.github.io.git public

echo "YOU'RE ALL SET! MAKE CHANGES THEN RUN:"
echo ". deploy.sh"
