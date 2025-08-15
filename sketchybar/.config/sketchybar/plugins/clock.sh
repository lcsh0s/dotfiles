#!/usr/bin/env bash

time=$(date | awk '{print $4 }' | cut -d: -f1,2)

sketchybar --set clock label="$time"
