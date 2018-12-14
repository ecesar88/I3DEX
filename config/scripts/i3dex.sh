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

echo "== > Olá "$USER", estamos iniciando a instalação da última versão do I3DEX!"
    echo "== >"

echo "== > Instalando pacotes essenciais"
    sudo pacman -S --needed alsa-utils compton dunst i3-gaps networkmanager notify-osd playerctl pulseaudio pulseaudio-alsa rofi sddm termite ttf-dejavu xorg-server xorg-xinit xorg-xprop xorg-xrandr ttf-fira-sans ttf-fira-mono ranger feh playerctl scrot maim git 
    echo "== >"

if pergunta "== > Instalar TRIZEN? Não é necessário instalar caso já tenha!" S; then
    mkdir TRIZEN-DEX 
    cd TRIZEN-DEX 
    git clone https://aur.archlinux.org/trizen.git
    cd trizen
    makepkg -si
    cd ..
    cd ..
    sudo rm -dR TRIZEN-DEX
    echo "== >"
fi

echo "== > Instalando pacotes essenciais com o TRIZEN."
    trizen -S --needed google-chrome polybar visual-studio-code-bin nerd-fonts-source-code-pro --noconfirm
echo "== >"

echo "== > Configurando o Ranger"
    mkdir RANGER-DEX
    cd RANGER-DEX
    git clone https://github.com/alexanderjeurissen/ranger_devicons.git
    cd ranger_devicons/
    make install
    cd ..
    cd ..
    sudo rm -dR RANGER-DEX
echo "== >"

echo "== > Habilitando serviços"
    echo "==== > Habilitando conexão com a internet"
        sudo systemctl enable dhcpcd.service
        sudo systemctl start dhcpcd
    echo "==== >"
    echo "==== > Habilitando networkmanager"
        sudo systemctl enable NetworkManager.service
        sudo systemctl start NetworkManager
    echo "==== >"
    echo "==== > Habilitando SDDM"
        sudo systemctl enable sddm.service
echo "== >"

echo "== > Criando diretórios básicos"
    mkdir $HOME/{Documentos,Downloads,Imagens,Modelos,Músicas,Público,Vídeos}
    mkdir $HOME/Imagens/Screenshots
    mkdir $HOME/Vídeos/Screencasts
    mkdir $HOME/.config/spotifylog
echo "== >"

echo "Baixando I3DEX"
    cd
    sudo rm -dR I3DEX
    git clone https://github.com/jirrezdex/I3DEX.git | exit
    cd I3DEX/config
echo "== >"

echo "Fornecendo permissão aos scripts"
    chmod +x scripts/*
echo "== >"

echo "Medidade de segurança"
    rm -dR $HOME/.config/{papeldeparede,compton,dunst,i3,polybar,rofi,scripts,sons}
echo "== >"

echo "Instalando configuração"
    echo "==== > Instalando arquivos básicos"
        cp -r {papeldeparede,compton,dunst,i3,polybar,rofi,scripts,sons} $HOME/.config
    echo "==== > Instalando fontes"
        mkdir $HOME/.local/share/fonts
        cd fonts
        cp feather.ttf $HOME/.local/share/fonts
        cd ..
    echo "==== > Instalando arquivos com requesição de senha"
        sudo rm -dR /etc/xdg/termite
        sudo cp -r termite /etc/xdg
echo "== >"

echo "Removendo arquivos desnecessários"
    cd ..
    cd ..
    sudo rm -dR ArchDex ;
echo "== >"

if pergunta "== > Remover arquivos da configuração pessoal do desenvolvedor? Recomendado, os arquivos podem causar problemas na sua instalação!" S; then
    sudo rm -dR $HOME/.config/scripts/pessoal.sh
    echo "== >"
fi

echo "Recarregando sistema"
    i3-msg restart
    canberra-gtk-play --file=$HOME/.config/sons/bip.wav
echo "== >"