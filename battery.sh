#!/bin/bash

upower -i $(upower -e | grep BAT0) | grep  "percentage:" | grep -o [^:].*
upower -i $(upower -e | grep BAT1) | grep  "percentage:"
