#!/bin/bash

# Build script for Marmelado OS
WORK_DIR="/path/to/work"
OUT_DIR="/path/to/out"
PROFILE_DIR="/path/to/profile"

# Other previous lines...

# Updated line 98 for mkarchiso
mkarchiso -v -w "$WORK_DIR/work" -o "$OUT_DIR/marmelado-os-x86_64.iso" "$PROFILE_DIR"