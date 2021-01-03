#!/bin/sh
lock() {
  if [[ "$HOSTNAME" =~ "desk" ]]
  then
    i3lock -t -i ~/pictures/backgrounds/random-background.png

    export filename=$(find ~/pictures -iname "*.jpg" | shuf -n1)
    convert "$filename" \
      -auto-orient \
      -thumbnail 3840x2160 \
      -append \
      -background white \
      -size x20 \
      -fill black \
      -gravity south \
      label:"$filename" \
      -gravity southwest \
      -compose over -composite \
      -gravity center \
      -background black \
      -extent 3840x2160 \
      -gravity east \
      -background black \
      -extent 4920x2160 \
      ~/pictures/backgrounds/random-background.png
  else
    i3lock -t -i ~/pictures/backgrounds/gandia_playa.png
  fi
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        systemctl suspend
        ;;
    hibernate)
        systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
