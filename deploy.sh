#!/bin/bash

if [[ -z "$AWS_PROFILE" ]]; then
    echo "Set AWS_PROFILE before running this script" 1>&2
    echo "Options Are:"
    aws configure list-profiles
    exit 1
fi
echo AWS_PROFILE is $AWS_PROFILE
read -r -p "Are you sure? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "Deploy"
    sls deploy
else
    echo "Canceling Deploy"
fi