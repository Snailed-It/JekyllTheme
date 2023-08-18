#!/bin/sh

# You can run this script with
# ./internal_scripts/create_release_notes.sh -d01 -m06 -y2023
# or without any of the arguments in which case it will just use the current date
# It will create a new blog post template in _posts

DAY="$(date +%d)"
MONTH="$(date +%m)"
YEAR="$(date +%Y)"

while getopts ":d:m:y:" opt; do
  case $opt in
    d) DAY="$OPTARG"
    ;;
    m) MONTH="$OPTARG"
    ;;
    y) YEAR="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    exit 1
    ;;
  esac

  case $OPTARG in
    -*) echo "Option $opt needs a valid argument"
    exit 1
    ;;
  esac
done

FILENAME="_posts/${YEAR}-${MONTH}-${DAY}-release-${YEAR}-${MONTH}.md"

tee $FILENAME << blog_post
---
title: "${YEAR}.${MONTH}: TKTK"
date: ${YEAR}-${MONTH}-${DAY}
permalink: /release-notes/${YEAR}-${MONTH}
published: true
layout: blog_post_release
build:
  ios: "${YEAR}.${MONTH}"
tags:
  - TKTK
category: Release Notes
---
TKTK

TODO: Update _config.yml with the new build numbers
blog_post
