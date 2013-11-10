#! /bin/bash

# Push command

if [ $# -eq 0 ] ; then
    echo 'Pushing code to '$(git rev-parse --abbrev-ref HEAD)'... please wait.';
    echo 'REFERENCE: git push origin '$(git rev-parse --abbrev-ref HEAD);
    git push origin $(git rev-parse --abbrev-ref HEAD);
    echo 'Successfully pushed to '$(git rev-parse --abbrev-ref HEAD)'.';
    exit 1
fi

if [ $1 eq 'gh' ]
then
	echo 'Pushing code to '$(git rev-parse --abbrev-ref HEAD)', then cloning in gh-pages... please wait.';
  echo 'REFERENCE: git push origin '$(git rev-parse --abbrev-ref HEAD)';git checkout gh-pages;git pull origin '$(git rev-parse --abbrev-ref HEAD)';git push origin gh-pages;git checkout '$(git rev-parse --abbrev-ref HEAD);
  git push origin $(git rev-parse --abbrev-ref HEAD);git checkout gh-pages;git pull origin $(git rev-parse --abbrev-ref HEAD);git push origin gh-pages;git checkout $(git rev-parse --abbrev-ref HEAD)
  echo 'Successfully pushed to '$(git rev-parse --abbrev-ref HEAD)'.';
  exit 1
else
	
	
fi
