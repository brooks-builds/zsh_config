#!/bin/zsh

# We have updated the local version of our .zshrc file, so we need to
# - overwrite the one here
# - upload to github
LOGFILE=script_out

echo "\n***** Running upload to github script *****\n" >> $LOGFILE

if [[ -f $HOME/.zshrc ]]; then
  echo "found .zshrc file in home directory"
else
  echo "could not find .zshrc file in home directory"
  exit 1
fi

if git pull >> $LOGFILE; then
  echo "updated .zshrc from github"
else
  echo "failed to update .zshrc from github"
  exit 2
fi

if cp $HOME/.zshrc ./.zshrc >> $LOGFILE; then
  echo "copied in .zshrc"
else
  echo "failed to copy in .zshrc from home directory"
  exit 3
fi

if [[ -v 1 && -n "$1" ]]; then
  COMMIT_MESSAGE=${1}
else 
  COMMIT_MESSAGE=updating .zshrc from local
fi

if git commit -am "$COMMIT_MESSAGE" >> $LOGFILE; then
  echo "commited to git"
else
  echo "failed to commit new version of .zshrc file"
  exit 4
fi

if git push >> $LOGFILE; then
  echo "pushed to github"
else
  echo "failed to push changes to github"
  exit 5
fi

echo "local .zshrc pushed to github"