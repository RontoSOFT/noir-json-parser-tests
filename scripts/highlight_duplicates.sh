#!/bin/bash

clear

# Search for the keywords and extract the relevant information
# Output the result with highlighting duplicates

folder="../src"

# output >> "{path}:{line}: {match}"
# {
#     grep -r -E -o -n "(assert\(can_parse_as_(property|value))\(\S+\)" "$folder" | sed 's/:/: /2' &
#     grep -r -E -o -n "JSON::parse\(\S+\)" "$folder" | sed 's/:/: /2'
# }
{
    grep -r -E -o -n "(assert\(can_parse_as_(nested|property|value))\(\S+\)" "$folder" | sed 's/:/: /2' &
    grep -r -E -o -n "JSON::parse\(\S+\)" "$folder" | sed 's/:/: /2'
} | awk '
{
    split($2, fields, /(assert\(can_parse_as_|JSON::parse)/);
    split($0, subfields, /((d|y|e)\("|"\))/);

    if      ($2 ~ /prop/) { print "property \"" subfields[2] "\"" }
    else if ($2 ~ /valu/) { print "value \"" subfields[2] "\"" }
    else if ($2 ~ /nest/) { print "nested \"" subfields[2] "\"" }
    else if ($2 ~ /JSON/) { print "JSON \"" subfields[2] "\"" }
}' | sort | uniq -c | awk '
{
    if ($1 > 1) { print "\033[1;33m" $2 " " $3 "\033[0m - \033[0;93m" $1 "\033[0m" }
}'





# list=(
#     "$(grep -r -E -o -H -n "(assert\(can_parse_as_(property|value))\(\S+\)" "$folder" | sed 's/:/: /2' | awk -F/ '{print $NF}')"
#     "$(grep -r -E -o -H -n "JSON::parse\(\S+\)" "$folder" | sed 's/:/: /2' | awk -F/ '{print $NF}')"
# )

# # list="$(echo "${list[@]}" | sed 's/:/: /2' | awk -F/ '{print $NF}')"

# duplicates_list="$(echo "${list[@]}" | awk '{split($0, subfields, /: /); print subfields[2] }')"

# duplicates_list="$(echo "${duplicates_list[*]}" | awk '
#     {
#         split($0, subfields, /(y\("|e\(")|"\)/);

#         if      ($0 ~ /prop/) { print " property \"" subfields[2] "\"" }
#         else if ($0 ~ /valu/) { print " value \"" subfields[2] "\"" }
#         else if ($0 ~ /JSON/) { print " JSON \"" subfields[2] "\"" }
# }')"

# # echo "${duplicates_list[*]}" | sort | uniq -c
# # "${list[*]}"
# echo "${duplicates_list[@]}" | sort | uniq -c | awk -v list="${list[*]}" '
# {
#     if ($1 > 1)
#     {
#         n = split(list, arr, /(: )/);
#         print arr[1]
#         print arr[2]

#         print "\033[1;33m" $2 " " $3 "\033[0m - \033[0;93m" $1 "\033[0m"
#         # for (i = 1; i <= n; i+=2) {

#         #     print arr[i]

#         #     if (arr[i] ~ $3) {
#         #         print arr[i] " hello"
#         #     }
#         # }
#     }
# }'
