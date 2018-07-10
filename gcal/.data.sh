nownum=$(date +%s)
thennum=$((nownum+1209600))
now=$(date --date=@$nownum +%D)
then=$(date --date=@$thennum +%D)
if ping -q -c 1 -W 1 google.com >/dev/null; then
   gcalcli agenda  $now $then --nocolor>.temper
fi

