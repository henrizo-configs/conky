#!/bin/bash

# Prints calenda for current month, highlighting current day.

cal | sed -E "s/$(date +%d)/\${color2}&\${color}/"
