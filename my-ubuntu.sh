#!/bin/bash

#---------------------------------------------------------------
# Desenvolvido por Gabriel F. Vilar
# E-mail cogumm@gmail.com
# Website www.cogumm.net
#---------------------------------------------------------------

# script variables
#---------------------------------------------------------------
mainTitle="Meu Ubuntu"
tmpFile=`tempfile`

#---------------------------------------------------------------
# Atualizando o sistema antes da instalação dos programas
installServerUpdates()
{
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get dist-upgrade

    return
}

# VIM
installVim()
{
    sudo apt-get install vim
    
    return
}
# Instalando Apache
installApache()
{
    sudo apt-get install apache2
    
    return
}

# Instalando MySQL
installMySQL()
{
    sudo apt-get install mysql-server-5.1 
    
    echo ""
    echo "Type your MySQL root password:"
    echo "\
        CREATE DATABASE \`${username}\` CHARACTER SET utf8; \
        USE \`${username}_production\`; \
        GRANT ALL PRIVILEGES ON \`${username}\`.* TO '$username'@'localhost' IDENTIFIED BY '$mysql_password'; \
        FLUSH PRIVILEGES;" | mysql -u root -p
        
    sudo /etc/init.d/mysql restart
    
    cd /var/
    sudo chmod -R 777 www/
    cd www/
    echo "<?php phpinfo() ?>"  >> info.php 
    
    return
}

# Instalando PHP5
installPHP()
{
    sudo apt-get install php5 php5-cli php5-curl php5-mysql php5-pgsql php5-sqlite
    
    return
}

# Instalando phpMyAdmin
installphpMyAdmin()
{
    sudo apt-get install phpmyadmin
    
    sudo /etc/init.d/apache2 restart
    
    return
}

# Instalando Git
installGit()
{
    sudo apt-get install git-core git-gui git-doc gitg
    
    return
}

# Aplicações pessoais
# Docky
installDocky()
{
    sudo add-apt-repository ppa:docky-core/ppa 
    sudo apt-get update
    sudo apt-get docky
    
    return
}

# Dropbox
installDropbox()
{
    sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
    sudo sh -c 'echo "deb http://linux.dropbox.com/ubuntu/ natty main" >> /etc/apt/sources.list.d/dropbox.list' 
    
    sudo apt-get update 
    sudo apt-get install nautilus-dropbox
    
    return
}

# Google Chrome
installGoogleChrome()
{
    cd ~
    if [ -e temp ]
    then
        echo "Diretório já existe."
        cd ~/temp/
    else
        mkdir temp
        cd ~/temp/
    fi
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
    sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
    
    sudo apt-get update 
    sudo apt-get install google-chrome-stable

    return
}

# Google Talk Plugin
installGoogleTalkPlugin()
{
    sudo sh -c 'echo "deb http://dl.google.com/linux/talkplugin/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

    sudo apt-get update 
    sudo apt-get install google-talkplugin
    
    return
}

# jDownload
installjDownload()
{
    sudo add-apt-repository ppa:jd-team/jdownloader
    sudo apt-get update
    sudo apt-get install jdownloader
    
    return
}

# Removendo o OpenOffice e instalando o LibreOffice
OpenOfficeLibreOffice()
{
    sudo apt-get -y purge openoffice*
    sudo apt-get autoclean
    sudo apt-get autoremove
    
    # Baixando o LibreOffice estável
    cd ~
    if [ -e LibreOffice ]
    then
        echo "Diretório já existe."
        cd ~/LibreOffice/
    else
        mkdir LibreOffice
        cd ~/LibreOffice/
    fi
    wget http://download.documentfoundation.org/libreoffice/stable/3.3.3/deb/x86/LibO_3.3.3_Linux_x86_install-deb_en-US.tar.gz
    wget http://download.documentfoundation.org/libreoffice/stable/3.3.3/deb/x86/LibO_3.3.3_Linux_x86_langpack-deb_pt-BR.tar.gz
    wget http://download.documentfoundation.org/libreoffice/stable/3.3.3/deb/x86/LibO_3.3.3_Linux_x86_helppack-deb_pt-BR.tar.gz
    
    # Descompactando.
    tar -zxvf LibO_3.3.3_Linux_x86_install-deb_en-US.tar.gz
    tar -zxvf LibO_3.3.3_Linux_x86_langpack-deb_pt-BR.tar.gz
    tar -zxvf LibO_3.3.3_Linux_x86_helppack-deb_pt-BR.tar.gz
    
    # Instalando.
    cd ~/LibreOffice/LibO_3.3.3rc1_Linux_x86_install-deb_en-US/DEBS/
    sudo dpkg -i *.deb
    cd ~/LibreOffice/LibO_3.3.3rc1_Linux_x86_langpack-deb_pt-BR/DEBS/
    sudo dpkg -i *.deb
    cd ~/LibreOffice/LibO_3.3.3rc1_Linux_x86_helppack-deb_pt-BR/DEBS
    sudo dpkg -i *.deb
    # Criando os atalhos no menu.
    cd ~/LibreOffice/LibO_3.3.3rc1_Linux_x86_install-deb_en-US/DEBS/desktop-integration/
    sudo dpkg -i *.deb
    # Atualizando os pacotes, caso haja alguma.
    cd ~/LibreOffice/LibO_3.3.3rc1_Linux_x86_install-deb_en-US/
    sudo sh update
    
    return
}

# GEdit
installGedit()
{
    sudo apt-add-repository ppa:ubuntu-on-rails/ppa
    sudo apt-get update
    sudo apt-get install gedit-gmate
    
    return
}

# Ubuntu-Tweak
installUbuntuTweak()
{
    sudo add-apt-repository ppa:tualatrix/ppa
    sudo apt-get update
    sudo apt-get install ubuntu-tweak
    
    return
}

# PostgreSQL
installPG()
{
    sudo apt-get install -y postgresql
    sudo apt-get install -y pgadmin3
    
    sudo su postgres -c psql postgres
    
    echo ""
    echo "Type your PG root password:"
    echo "\
        ALTER USER postgres WITH PASSWORD 'root'; \
        \q;"
        
    sudo /etc/init.d/postgresql restart
    
    return
}

# VLC
installVLC()
{
    sudo add-apt-repository ppa:ferramroberto/vlc
    sudo apt-get update
    sudo apt-get install -y vlc mozilla-plugin-vlc
    
    return
}

# MySQL-Workbench
installMySQLWorkbench()
{
    cd ~
    if [ -e temp ]
    then
        echo "Diretório já existe."
        cd ~/temp/
    else
        mkdir temp
        cd ~/temp/
    fi
    wget http://dl.dropbox.com/u/1774817/myUbuntu/mysql-workbench-gpl-5.2.33b-1ubu1010-i386.deb
    sudo dpkg -i mysql-workbench-gpl-5.2.33b-1ubu1010-i386.deb
    
    return
}

# TeamViewer
installTeamViewer()
{
    cd ~
    if [ -e temp ]
    then
        echo "Diretório já existe."
        cd ~/temp/
    else
        mkdir temp
        cd ~/temp/
    fi
    wget http://dl.dropbox.com/u/1774817/myUbuntu/teamviewer_linux.deb
    sudo dpkg -i teamviewer_linux.deb
    
    return
}


# Eclipse
installEclipse()
{
    cd ~
    if [ -e temp ]
    then
        echo "Diretório já existe."
        cd ~/temp/
    else
        mkdir temp
        cd ~/temp/
    fi
    wget http://dl.dropbox.com/u/1774817/myUbuntu/eclipse-php-helios-SR2-linux-gtk.tar.gz
    tar -zxvf eclipse-php-helios-SR2-linux-gtk.tar.gz 
    sudo mv eclipse /opt/

    return
}

# Skype
installSkype()
{
    cd ~
    if [ -e temp ]
    then
        echo "Diretório já existe."
        cd ~/temp/
    else
        mkdir temp
        cd ~/temp/
    fi
    wget http://download.skype.com/linux/skype-ubuntu_2.2.0.35-1_i386.deb
    sudo dpkg -i skype-ubuntu_2.2.0.35-1_i386.deb

    return
}


# Gestão de arquivo
installZIP()
{
    sudo apt-get install -y unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack lha arj cabextract file-roller
    
    return
}

# Váriados
installAll()
{
    sudo apt-get install -y gnome-do
    sudo apt-get install -y gimp
    sudo apt-get install -y guake 
    sudo apt-get install -y gtranslator
    sudo apt-get install -y xchat
}

# Should remove tmp file and clear the screen before exiting
exitScript()
{
    clear
    exit 0
}

# Get return and if is esc or cancel, exit
exitIfCancelOrESC()
{
    action=$1
    
    case $action in
        1) exitScript;;
        255) exitScript;;
        *) return;;
    esac 
}

# Removendo o Lixo
# Removendo tudo
installClean()
{
    sudo apt-get autoclean
    sudo apt-get autoremove
    cd ~/
    sudo rm -rf ~/LibreOffice/
    sudo rm -rf ~/temp/
}

# Instalando o dialog
#---------------------------------------------------------------
sudo apt-get install dialog

# Tela de bem vinda
#---------------------------------------------------------------
dialog --backtitle "$mainTitle" --title "Bem vindo!" \
       --yesno "Olá, este é um script para a instalação de alguns pacotes para o Ubuntu.\n\nVocê tem certeza que deseja continuar?" \
       13 50 2> $tmpFile

input=$?
exitIfCancelOrESC $input
clear

#---------------------------------------------------------------
dialog  --backtitle "$mainTitle" --title "Conta de usuário" \
        --inputbox "Um usuário será criado para armazenar todos os arquivos de configuração e sua aplicação.\n\nDigite o nome de usuário abaixo." \
        12 50 app_test 2> $tmpFile

input=$?
exitIfCancelOrESC $input
username=`cat $tmpFile`
clear

# MySQL senha
#---------------------------------------------------------------
dialog  --backtitle "$mainTitle" --title "Conta de usuário do MySQL" \
        --inputbox "Um usuário será adicionado ao MySQL '$username'. Além disso, um banco de dados chamado '${username}' também será criado.\n\nPor favor, digite uma nova senha. para este usuário MySQL." \
        13 50 2> $tmpFile

input=$?
exitIfCancelOrESC $input
mysql_password=`cat $tmpFile`
clear

# Start the process
#---------------------------------------------------------------
installServerUpdates
installVim
installApache
installMySQL
installPHP
installphpMyAdmin
installGit
installDocky
installDropbox
installGoogleChrome
installGoogleTalkPlugin
installjDownload
OpenOfficeLibreOffice
installGedit
installUbuntuTweak
installPG
installVLC
installMySQLWorkbench
installTeamViewer
installEclipse
installSkype
installZIP
installAll
installClean


dialog  --backtitle "$mainTitle" --title "Instalação completa!" \
        --msgbox "Para testar o Apache+PHP acesse http://$domain/info.php e veja se esta tudo ok." 8 50

clear
exit 0
