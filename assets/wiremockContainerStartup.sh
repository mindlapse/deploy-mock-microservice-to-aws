#!/usr/bin/env bash

# Check out the samples
echo Checking out samples repo
git clone --single-branch --branch $GIT_BRANCH $GIT_REPO /mockdata

# Copy in the health check endpoint ('curl http://ip/api/healthCheck' to check the health)
mkdir --parents /mockdata/mappings
cp /data/healthCheck.json /mockdata/mappings

# Refresh the samples every minute
echo Configuring cron to refresh samples each minute
chmod ugo+x /data/refresh_samples_cron.sh
echo '*/1 * * * * /data/refresh_samples_cron.sh' > ~/temp && crontab -u root ~/temp && rm ~/temp

echo Starting the cron daemon
service cron start

# Start supervisord as pid 1, which will manage the wiremock process
echo Starting supervisord
/usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf