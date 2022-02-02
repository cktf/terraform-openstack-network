#!/bin/sh

# get_history() {
    
# }

# get_version() {
    
# }

# generate_next_version() {

# }

# generate_release_notes() {

# }

LATEST_TAG=$(git describe --tags --abbrev=0 @^)
LATEST_HISTORY=$(git log --format=%h $LATEST_TAG..@)

PATTERN="(?<type>build|test|feat|fix)(?<scope>(?:\([^()\r\n]*\)|\()?(?<breaking>!)?)(?<subject>:.*)?"

for SHA in $LATEST_HISTORY
do
    MESSAGE=$(git log --format=%B -1 $SHA)

    if [[ $MESSAGE =~ $PATTERN ]]; then
        echo $MESSAGE
        echo ${BASH_REMATCH}
        echo "---------------------"   
    fi
    # if [[ $SUBJECT =~ $MAJOR_PATTERN ]]; then
    #     echo MAJOR
    # elif [[ $SUBJECT =~ $MINOR_PATTERN ]]; then
    #     echo $SUBJECT
    #     echo MINOR
    #     echo "------------------"
    # elif [[ $SUBJECT =~ $PATCH_PATTERN ]]; then
    #     echo $SUBJECT
    #     echo PATCH
    #     echo "------------------"
    # fi
done