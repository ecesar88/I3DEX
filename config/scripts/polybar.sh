#!/usr/bin/env bash
# www.jirrezdex.com
# contato@jirrezdex.com
# Jirrez Matheus

####################### Finaliza todas as Polybars
killall -q polybar

####################### Espera todos os processos finalizarem
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

####################### Iniciar barra de cima e de baixo
polybar cima &
polybar baixo &
