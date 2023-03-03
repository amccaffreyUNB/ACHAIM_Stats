#!/bin/bash

cd /home2/achaim1/ACHAIM_Stats

git add .
git commit -m "update $(date '+%Y-%m-%d %H:%M:%S')"
git push
