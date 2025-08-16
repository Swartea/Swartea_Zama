#!/usr/bin/env bash
for i in $(seq 1 12); do
  ts=$(date -u -d "2025-06-10 06:00:00 UTC + $((i*5)) minutes" "+%Y-%m-%dT%H:%M:%S")
  echo "Backdated commit $i at $ts" >> README.md
  git add README.md
  GIT_AUTHOR_DATE="$ts" GIT_COMMITTER_DATE="$ts" \
    git commit -m "Backdated commit $i ($ts)"
done
