#!/usr/bin/env bash
# www.jirrezdex.com
# contato@jirrezdex.com
# Jirrez Matheus

################ Aplicando papel de parede de acordo com a hora
HORA=$(date "+%k")
    if ((HORA >= 20 )); then
        feh --bg-scale $HOME/.config/papeldeparede/Noite.png ;
    elif ((HORA >= 6 )); then
        feh --bg-scale $HOME/.config/papeldeparede/Dia.png ;
    else
        feh --bg-scale $HOME/.config/papeldeparede/Noite.png ;
fi
sleep 60m ;
done