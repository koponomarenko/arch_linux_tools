#!/bin/bash
. common_helpers/functions.sh

# Ensure the system clock is accurate
cmd_do timedatectl set-ntp true >/dev/null
