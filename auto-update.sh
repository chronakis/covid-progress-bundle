#!/bin/sh
git_keyword="Already"
#git_keyword="csse_covid_19_daily_reports"

git -C COVID-19 pull | grep $git_keyword && updates=true

if [ "$updates" != "true" ]; then
	exit 1
fi

cd covid-data-processor
./run.sh
cd ../covid-ui
git st
