#!/bin/bash

#Login Qumulo
"QQ_COMMAND" login -u "YOUR_USER_LOGIN" -p "YOUR_USER_PASSWORD"

# Get all shares and parse the ID column
shares=$(/opt/qumulo/cli/qq smb_list_shares | awk 'NR>2 {print $1}')

# Get current date in YYYY-MM-DD format
current_date=$(date +"%Y%m%d-%H_%M")

# Define filename and path to output
filename="all_share_details_$current_date.txt"

# Loop through each share ID
for share_id in $shares; do
  # Get all details for the curent share
  details=$(/opt/qumulo/cli/qq smb_list_share --id $share_id)

# Print details to text file (overwreite if exists)
echo "$details" >> "$filename"
done

echo "Share details saved to $filename" 