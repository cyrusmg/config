#!/bin/bash

curl -Ss http://meteo.kr-vysocina.cz/index.php | iconv -f CP1250 -t utf-8  | tr '\r\n' ' ' | sed -n -e 's/^.*-- temp: \([0-9]*,[0-9]*\).*Forecast icon" title="\([^"]*\).*/\1 °C\n/p'

