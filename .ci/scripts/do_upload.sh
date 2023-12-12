#!/bin/bash
old_hash=$1
new_hash=$2
cd $(dirname $0)/../..
aws s3 cp main.png s3://ahepp.dev/public/resume/previews/$new_hash.png
aws s3 cp diff.png s3://ahepp.dev/public/resume/diffs/$old_hash/$new_hash.png
