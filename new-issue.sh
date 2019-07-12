#! /usr/bin/env bash


if [ -z "$1" ]; then
    echo "Usage: new-issue Title of the issue"
    exit 1
fi


DATE=$(date +%F)
TIME=$(date +%T)
DATETIME="${DATE} ${TIME}"
TITLE=$@
SLUG=$(echo $TITLE | tr A-Z a-z | tr -dc "[:alnum:] " | tr [:blank:] '-')
FILENAME="content/issues/${DATE}-${SLUG}.md"

# Create new issue by copying template
cp content/issues/YYYY-MM-DD-template.md ${FILENAME}

# Update dates
sed -i '' -e "s/\$ISSUE_DATETIME/$DATETIME/g" ${FILENAME}

# Update title
sed -i '' -e "s/\$ISSUE_TITLE/$TITLE/g" ${FILENAME}

# Set published: true
sed -i '' -e "s/published: false/published: true/g" ${FILENAME}

# Remove "DO NOT REMOVE" comment from final file
sed -i '' -e "/^# DO NOT REMOVE/d" ${FILENAME}

# Print instructions
echo "A new issue is been created at '$FILENAME'"
echo ""
echo "****  IMPORTANT  ****"
echo "- edit this file to add the details about the issue"
echo "- be sure the list of affected systems is correct"
echo "- be sure the severity is correct"
echo "- use the '\$ hugo server' command to preview the Status Page"
echo "- use the '\$ hugo' command to re-build the Status Page files"
echo "- add, commit and push the files in '/docs' once you're happy with the output"
