#!/bin/sh
#export AWS_PROFILE=covid
export JAVA_HOME=/c/Java/jdk-9
export PATH=/c/Java/jdk-9/bin:$PATH

AWS="aws --profile covid"
BUCKET=covid-progress.net

#git_keyword="Already"
git_keyword="csse_covid_19_daily_reports"

git -C COVID-19 pull | grep $git_keyword && UPDATES_PRESENT=true

# Debug
UPDATES_PRESENT=true

if [ "$UPDATES_PRESENT" != "true" ]; then
	exit 1
fi

cd covid-data-processor
./run.sh
cd ../covid-ui
$AWS s3 sync data s3://covid-progress.net/data
