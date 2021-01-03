function switch_to_sink() {
  echo switching default
  pacmd set-default-sink $1 ||
    echo failed
  echo switching applications
  pacmd list-sink-inputs |
    awk '/index:/{print $2}' |
    xargs -r -I{} pacmd move-sink-input {} $1 ||
      echo failed
}

case "${1:-}" in
  (""|list)
    pacmd list-sinks |
      grep -E 'index:|name:'
    ;;
  (next)
    sinks=$(pacmd list-sinks | grep -E 'index:')

    IFS=$'\n'
    first_sink=
    switch_to_next=false
    for sink in $sinks; do
      echo "[$sink]"
      if [[ "$sink" =~ .*\*.* ]]; then
        echo "Setting switch_to_next"
        switch_to_next=true
      elif $switch_to_next; then
        echo "Switching to next"
        switch_to_sink ${sink//[!0-9]/}
        exit
      elif [ -z "$first_sink" ]; then
        echo "Marking as first sink"
        first_sink=$sink
      fi
    done

    switch_to_sink ${first_sink//[!0-9]/}
    ;;
  ([0-9]*)
    switch_to_sink $1
    ;;
  (*)
    echo "Usage: $0 [|list|<sink name to switch to>]"
    ;;
esac
