#!/bin/bash
token=$1
pr=$2
old_hash=$3
new_hash=$4
url="https://api.github.com/repos/ahepp/resume/issues/${pr}/comments"
s3_base="https://s3.amazonaws.com/ahepp.dev/public/resume/"
new="![new version of resume](${s3_base}previews/${new_hash}.png)"
diff="![diff of resume](${s3_base}diffs/${old_hash}/${new_hash}.png)"
comment="| new  | diff  |\n| ---- | ----- |\n| $new | $diff |\n"

curl -L -X POST \
    -H "Authorization: Bearer $token" \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    $url \
    -d "{\"body\": \"$comment\"}"
