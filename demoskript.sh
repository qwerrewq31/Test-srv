#!/bin/bash
#Дата выполнения процесса.
date=$(date)
#Занесение информации о старте мониторинга в лог.
echo 'The monitoring process has started' $date >> /var/log/monitoring.log
#Тест источника.
test=$(curl -I -w '%{time_total}demoZXC' --url https://test.com/monitoring/test/api -m 15 -s)
#При ошибке занесение ошибки в переменную.
error=$(echo $?)
#Условие работы источника.
work=0
#При 0
code=$(echo "$test" | head -n1)
dlay=$(echo "$test" | grep demoZXC | sed -e 's/demoZXC//')
#При ошибке работы выведение в лог.
if [ "$error" -ne "$work" ]
    then

        echo 'unavailable error' $error >> /var/log/monitoring.log
    else

        echo 'Код:' $code 
        echo 'Задержка:' $dlay
fi




