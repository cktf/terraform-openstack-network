#!/bin/sh

get_history() {
    LATEST_TAG=$(git describe --tags --abbrev=0 @^)
    LATEST_HISTORY=$(git log $LATEST_TAG..@)
    echo $LATEST_HISTORY
}

get_history
