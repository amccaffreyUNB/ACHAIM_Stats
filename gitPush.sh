#!/bin/bash
#script to push changes to github (pages)

cd /home2/achaim1/ACHAIM_Stats

git pull
git add -A
git commit -m "update $(date '+%Y-%m-%d %H:%M:%S')"
git push
