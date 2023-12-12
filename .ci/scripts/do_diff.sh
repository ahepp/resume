#!/bin/bash
old_hash=$1
cd $(dirname $0)/../..
aws s3 cp s3://ahepp.dev/public/resume/previews/$old_hash.png old.png
./scripts/diff.sh old.png main.png diff.png
