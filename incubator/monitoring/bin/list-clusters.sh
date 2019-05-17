#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"
source common.sh

ls ~/conf/*.conf | rev | cut -d/ -f1 | rev | cut -d. -f1
