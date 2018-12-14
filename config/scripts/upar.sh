#!/usr/bin/env bash
# www.jirrezdex.com
# contato@jirrezdex.com
# Jirrez Matheus

pergunta() {
    local prompt default reply
    while true; do
        if [ "${2:-}" = "Y" ]; then
            prompt="S/N"
            default=S
        elif [ "${2:-}" = "N" ]; then
            prompt="S/N"
            default=N
        else
            prompt="S/N"
            default=
        fi
        echo -n "$1 [$prompt] "
        read reply </dev/tty
        if [ -z "$reply" ]; then
            reply=$default
        fi
        case "$reply" in
            [Ss]*) return 0  ;;
            [Nn]*) return  1 ;;
        esac
    done
}

echo "== > Olá "$USER", os arquivos estão sendo movidos para o diretório!"
echo "== >"

echo "== > Verificação"
    cd $HOME/GitHub/I3DEX
    git pull
    cd config
echo "== >"

echo "== > Medidas de segurança"
    sudo rm -dR {papeldeparede,ranger,compton,dunst,i3,polybar,rofi,scripts,sons,termite}
echo "== >"

echo "== > Copiando arquivos"
    cp -r $HOME/.config/{papeldeparede,ranger,compton,dunst,i3,polybar,rofi,scripts,sons} $HOME/GitHub/I3DEX/config
    sudo cp -r /etc/xdg/termite $HOME/GitHub/I3DEX/config
echo "== >"

if pergunta "== > Fazer upload para o GitHub?" S; then
    cd $HOME/GitHub/I3DEX ;
    git add --all ;
    git commit ;
    git push -u origin master ;
    notify-send "Arquivos upados" ;
    canberra-gtk-play --file=$HOME/.config/sons/bip.wav
    exit
echo "== >"
fi

echo "== > Finalizando"
    notify-send "Cópia concluída" ;
    canberra-gtk-play --file=$HOME/.config/sons/bip.wav
echo "== >"