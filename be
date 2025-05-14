#!/bin/bash
file="${1:-blank}"
declare -A buf

if [[ -f "$file" ]]; then
  i=10
  while IFS= read -r line; do
    buf["$i"]="$line"
    ((i+=10))
  done < "$file"
fi

for k in $(printf "%s\n" "${!buf[@]}" | sort -n); do
  echo "$k ${buf[$k]}"
done

while true; do
  read -e -p "" line

  case "$line" in
    save)
      for k in $(printf "%s\n" "${!buf[@]}" | sort -n); do
        echo "${buf[$k]}"
      done > "$file"
      echo "Save $file"
      break
      ;;
    list)
      for k in $(printf "%s\n" "${!buf[@]}" | sort -n); do
        echo "$k ${buf[$k]}"
      done
      ;;
    clr)
      clear
      ;;
    ren)
      new=10
      declare -A tmp
      for k in $(printf "%s\n" "${!buf[@]}" | sort -n); do
        tmp["$new"]="${buf[$k]}"
        ((new+=10))
      done
      for k in "${!buf[@]}"; do unset buf["$k"]; done
      for k in "${!tmp[@]}"; do buf["$k"]="${tmp[$k]}"; done
      ;;
    new)
      unset buf
      ;;  
    [0-9]*\ *)
      num="${line%% *}"
      txt="${line#* }"
      buf["$num"]="$txt"
      ;;
    [0-9]*)
      unset buf["$line"]
      ;;
    *)
      echo "err:allow save,clr,ren,new or line number"
      ;;
  esac
done
