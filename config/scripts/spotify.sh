#!/usr/bin/env bash
# www.jirrezdex.com
# contato@jirrezdex.com
# Jirrez Matheus

################ Medida protetiva
playerctl status &> $HOME/.config/spotifylog/.spotifylog

################ Exibição de  Artista - Título
if [ $? == 1 ]; then
  echo ""
elif [ "$(playerctl status)" == "Playing" ]; then
  artist=`exec playerctl metadata artist`
  title=`exec playerctl metadata title`
  echo " $artist - $title"
elif [ "$(playerctl status)" == "Paused" ]; then
  artist=`exec playerctl metadata artist`
  title=`exec playerctl metadata title`
  echo " $artist - $title"
else
  echo ""
fi
