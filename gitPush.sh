#!/bin/bash
#script to push changes to github (pages)

source ~/.A-CHAIM.conf

cd $ROOTDIR/ACHAIM_Stats

git pull
git add -A
git commit -m "update $(date '+%Y-%m-%d %H:%M:%S')"
git push
