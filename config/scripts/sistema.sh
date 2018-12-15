#!/usr/bin/env bash
# www.jirrezdex.com
# contato@jirrezdex.com
# Jirrez Matheus

res=$(echo "-Bloquear;-Reiniciar;-Desligar" | rofi -sep ";" -dmenu -p "Controle do sistema" -bw 0 -separator-style none -location 0 -width 20 -lines 3 -padding 5)
if [ ! -z $res ]; then
  case $res in
    -Bloquear)
      su -
    ;;
    -Reiniciar)
      sudo reboot
    ;;
    -Desligar)
      sudo poweroff
    ;;
  esac
fi