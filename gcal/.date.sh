temp=$(sed -e "s/.\{50\}/&\n\t\t\t/g" < .temper)
x=$(date +'%a %b %d')
# echo -n "${temp/$x/$x*}"
echo -n "$temp"

