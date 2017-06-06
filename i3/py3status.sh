#!/bin/sh

SCRIPT_DIR=$(dirname $(readlink -f "$0"))
VENV=$SCRIPT_DIR/venv

exec $VENV/bin/py3status --interval 2 -c $SCRIPT_DIR/status-bar.config
