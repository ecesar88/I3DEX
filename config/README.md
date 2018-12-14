# I3DEX - Instalação da configuração

> 1. ATENÇÃO: Siga todos os passos aqui postados. Qualquer eventual problema será sua responsabildade.
> 2. A proposta aqui é, trazer um método de instalação simples e fácil de ser executado.
> 3. Qualquer usuário conseguirá instalar o I3DEX apartir deste repositório.
  
* Requisitos: Arch Linux e conexão cabeada:

## ⚙ 1° Passo: Logue como root:
* ...

## ⚙ 2° Passo: Deixe o teclado em pt_BR:
```loadkeys br-abnt2```  
```mkdir /etc/X11/xorg.conf.d```  
```nano /etc/X11/xorg.conf.d/10-evdev.conf```  
```
Section “InputClass”
	Identifier “evdev keyboard catchall”
	MatchIsKeyboard “on”
	MatchDevicePath “/dev/input/event*”
	Driver “evdev”
	Option “XkbLayout” “br”
	Option “XkbVariant” “abnt2"
EndSection
```

## ⚙ 3° Passo: Adicione seu usuário ao grupo sudoers:
```nano /etc/sudoers```
* Procure por root *```ALL=(ALL) ALL```*, e abaixo insira *```<SEU USUÁRIO> ALL=(ALL) ALL```*

## ⚙ 4° Passo: Saia do root e logue com o seu usuário:
```exit```

## ⚙ 5° Passo: Dovamente, deixe o teclado em pt_BR:
```sudo loadkeys br-abnt2```

## ⚙ 6° Passo: Execute o script de instalação:
```bash <(curl -s https://raw.githubusercontent.com/jirrezdex/I3DEX/master/config/scripts/i3dex.sh)```
