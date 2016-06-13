#!/bin/bash
#https://en.wikipedia.org/wiki/Shebang_(Unix)
#http://unix.stackexchange.com/questions/206350/what-is-the-difference-if-i-start-bash-with-bin-bash-or-usr-bin-env-bash

#---ЗАДАНИЕ---
#Поиск панели через jps раз в 5 секунд
#Если панель не найдена, дождаться пока она появится снова, получить json с /info/version и записать  в лог

PANEL_URL="http://localhost:8080/first"

writeToLog=false

while true; do
    XXX=`jps -v | grep "\-DpanelName=" | cut -d " " -f1`
    if [ "$XXX" != "" ]; then
        echo "yes" #панель найдена через jsp
        if [ "$writeToLog" = true ]; then
            #получить json с /info/version и записать  в лог
            response=`curl --silent "$PANEL_URL/info/version" | grep "revision"`
            while [ "$response" = "" ]; do
                printf "."
                sleep 1
                response=`curl --silent "$PANEL_URL/info/version" | grep "revision"`
            done
            echo "$response" >> log
            echo "info"
            writeToLog=false
        fi
    else
        echo "no" #панель не найдена через jsp
        writeToLog=true
    fi
    sleep 5
done
