#!/bin/bash
#https://en.wikipedia.org/wiki/Shebang_(Unix)
#http://unix.stackexchange.com/questions/206350/what-is-the-difference-if-i-start-bash-with-bin-bash-or-usr-bin-env-bash

#это комментарий

#---ЗАДАНИЕ---
#Поиск панели через jps раз в 5 секунд
#Если панель не найдена, дождаться пока она появится снова, получить json с /info/version и записать  в лог

XXX=`jps -v | grep "\-DpanelName=" | cut -d " " -f1`
if [ "$XXX" != "" ]; then
    echo "yes" #панель найдена через jsp
else
    echo "no" #панель не найдена через jsp
fi

