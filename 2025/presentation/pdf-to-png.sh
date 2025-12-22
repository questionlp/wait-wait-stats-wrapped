#!/bin/bash

export PATH=/bin:/usr/bin:/usr/local/bin:$HOME/.local:$HOME/.local/bin

magick -density 200 -quality 100 "Wait Wait Stats Wrapped 2025.pdf" ../images/%d.png
