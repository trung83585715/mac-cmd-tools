#!/bin/bash
 if [[ -z "${1+present}" ]]; then 
	echo "COMMIT MESSAGE MISSING"
	exit 1
fi
cd ~/Desktop/source/kiuaddons2/
git checkout lms
echo "STAGING COMMIT"
git add .
echo "COMMITING WITH MESSAGE " $1
git commit -m "$1"
echo "MERGING lms BRANCH TO dev"
git checkout dev
git merge lms --no-edit
echo "PUSHING TO REMOTE dev BRANCH"
git pull origin dev --no-edit
git push origin dev
#echo "MERGING lms BRANCH TO prod"
#git pull origin prod --no-edit
#git checkout prod
#git merge lms --no-edit
echo "CHECKOUT TO lms BRANCH"
git checkout lms
