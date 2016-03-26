#!/usr/bin/env bash

# You do not need to run this script.
# This script added into the Docker image build and is set to run every minute in the container when it is deployed.
# It fetches the latest from the 'samples_git_repo' location configured in terraform.tf, and if there
# has been an update, then the wiremock server is restarted and ~/refresh_samples_cron.log is updated in the container.

touch /data/lastCommit
cd /mockdata
git pull
PRIOR_COMMIT=`cat /data/lastCommit`
LATEST_COMMIT=`git rev-parse HEAD`

# echo "`date` prior: $PRIOR_COMMIT latest: $LATEST_COMMIT" | tee --append /data/refresh_samples_cron.log

if [[ "$PRIOR_COMMIT" == "" ]]; then
	echo $LATEST_COMMIT > /data/lastCommit
	PRIOR_COMMIT=$LATEST_COMMIT
	echo Repo is currently at commit $LATEST_COMMIT >> /data/refresh_samples_cron.log
fi

if [[ "$LATEST_COMMIT" != "$PRIOR_COMMIT" ]]; then
	echo $LATEST_COMMIT > /data/lastCommit
	kill -9 `supervisorctl pid wiremock`
	echo `date`: Restarted wiremock with samples from commit $LATEST_COMMIT >> /data/refresh_samples_cron.log
fi

