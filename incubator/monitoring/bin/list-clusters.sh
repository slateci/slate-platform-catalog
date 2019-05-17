#!/bin/bash
ls ~/conf/*.conf | rev | cut -d/ -f1 | rev | cut -d. -f1
