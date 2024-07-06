#!/bin/bash

buildPlist=${INFOPLIST_FILE}
timeBuild=$(date +%s)

/usr/libexec/PlistBuddy -c "Add :BuildEnvironment dict" "$buildPlist"
/usr/libexec/PlistBuddy -c "Add :BuildEnvironment:BuildTimestamp string" "$buildPlist"
/usr/libexec/PlistBuddy -c "Set :BuildEnvironment:BuildTimestamp $timeBuild" "$buildPlist"


