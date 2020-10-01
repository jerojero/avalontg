#!/bin/bash
set -o nounset

REQUIRED_VARS=(
	CHAT_ID
	BOT_ID
	API_KEY
)

for v in ${REQUIRED_VARS[@]}; do
	set $v=${!v-$(1>&2 echo "ERROR: $v is unset, please set this environment variable" ; exit 1)}
done

curl -s -X GET "https://api.telegram.org/$BOT_ID:$API_KEY/sendMessage" -d parse_mode=html -d chat_id=CHAT_ID -d text="$*" > /dev/null
