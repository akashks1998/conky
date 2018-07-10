#!/bin/bash
user1="$(cat .user1)"
user2="$(cat .user2)"

email(){
  if ping -q -c 1 -W 1 google.com >/dev/null; then
      curl -u $user1:$user2 --silent "https://mail.google.com/mail/feed/atom" |  grep -oPm1 "(?<=<title>)[^<]+" | sed '1d'| head -15>~/.conky/email/.email
  fi
  cat ~/.conky/email/.email
}
name(){
  if ping -q -c 1 -W 1 google.com >/dev/null; then
    curl -u $user1:$user2 --silent "https://mail.google.com/mail/feed/atom" |  grep -oPm1 "[^<]+" | sed '1d' | grep -A 1 "author>"| grep "name"| tr ">" "\n"|grep -v "name"| head -15>~/.conky/email/.name
  fi
  cat ~/.conky/email/.name
}
if [ "$1" = "1" ];then
  email
else
  name
fi
