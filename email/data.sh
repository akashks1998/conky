#!/bin/bash
user1="$(cat ~/.user|sed '1q;d' )"
user2="$(cat ~/.user|sed '2q;d' )"

if ping -q -c 1 -W 1 google.com >/dev/null; then
  curl -u $user1:$user2 --silent "https://mail.google.com/mail/feed/atom" |  grep -oPm1 "(?<=<title>)[^<]+" | sed '1d'| head -15>~/.conky/email/.email
fi
if ping -q -c 1 -W 1 google.com >/dev/null; then
  curl -u $user1:$user2 --silent "https://mail.google.com/mail/feed/atom" |  grep -oPm1 "[^<]+" | sed '1d' | grep -A 1 "author>"| grep "name"| tr ">" "\n"|grep -v "name"| head -15>~/.conky/email/.name
fi
