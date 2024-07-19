#!/bin/bash
IFS=$'\n'
REPORT_PATH=/mnt/mp8report/
TOKEN_FILE=/root/.apitoken
PROCESS_LIST=/root/processed_list.txt

# replacing spaces in xml filenames
for f in $(ls $REPORT_PATH*xml); do mv "$f" "${f// /_}" 2>/dev/null; done
for i in $(find $REPORT_PATH -name "*.xml" -type f -exec cksum {} \;); do
	HASH=$(echo $i | awk '{print $1}')
	FILE=$(echo $i | awk '{print $3}')
	if ! grep -e $HASH $PROCESS_LIST; then
		# echo "NOT in list"
		echo $i >> $PROCESS_LIST
		/root/maxpatrol-tool --kuma-rest localhost:7223 --token $TOKEN_FILE --tenant Main $FILE
		write_to_log=$(echo "file: $FILE with hash: $HASH processed" | systemd-cat -t maxpatrol-tool -p info)
	fi
done
