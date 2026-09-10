#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")"
if [ ! -f jemdoc ]; then
  printf '%s\n' 'jemdoc is not installed. Downloading the official jemdoc-cvx generator...'
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL https://raw.githubusercontent.com/cvxgrp/jemdoc-cvx/main/jemdoc -o jemdoc
  elif command -v wget >/dev/null 2>&1; then
    wget -q https://raw.githubusercontent.com/cvxgrp/jemdoc-cvx/main/jemdoc -O jemdoc
  else
    printf '%s\n' 'Install curl or wget, or download cvxgrp/jemdoc-cvx/jemdoc into this directory.' >&2
    exit 1
  fi
fi
python3 jemdoc -c jemdoc-cvx.conf \
  index.jemdoc teaching.jemdoc bio.jemdoc people.jemdoc publications.jemdoc \
  slides/slides.jemdoc \
  courses/ee312/ee312.jemdoc courses/engr308/engr308.jemdoc \
  courses/engr504/engr504.jemdoc courses/engr507/engr507.jemdoc
printf '%s\n' 'Build complete. Open index.html to preview the site.'
