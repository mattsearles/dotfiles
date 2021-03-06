#!/bin/bash
#variables
buildNumber = $1;
currentBranch = $(git branch | grep \* | cut -d ' ' -f2)
echo 'Current Branch = '$currentBranch;
echo 'Build Number = ' $buildNumber;
read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	git tag -a -m 'State of $currentBranch before deployment of build $buildNumber' pre-build-$buildNumber
	git push origin pre-build-$buildNumber
	git reset --hard jenkins-ssplus-build-$buildNumber
	git push
fi