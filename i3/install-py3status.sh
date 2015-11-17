#!/bin/sh

SCRIPT_DIR=$(dirname $(readlink -f "$0"))
VENV=$SCRIPT_DIR/venv

virtualenv $VENV

pip() {
    $VENV/bin/pip $@
}

pip install py3status==2.6
pip install i3-py==0.6.4
