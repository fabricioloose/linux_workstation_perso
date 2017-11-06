#!/bin/bash
# Fabricio Eduardo Loose
# 19/08/2014
# Personalization MATE for user's


V_VERSION=1
V_BUILD=86

# ---------------------------------------------------------------------------------------------------------------
# | CODENAME trusty												|
# |														|
# | ubuntu-14.04-desktop-i386		(trusty)								|
# | ubuntu-14.04-desktop-amd64		(trusty)								|
# | ubuntu-14.04.2-desktop-i386	(trusty)								|
# |														|
# |	Some older hardware should run on the i386 platform (EFI errors) |
# |														|
# |														|
# ---------------------------------------------------------------------------------------------------------------

# Codenames: 
#		trusty (14.04-14.04.2), 
#		utopic (14.10), 
#		vivid (15.04)

# PACKAGES
# apt-get
# Force installation/removal of packages.
# apt-get --force-yes install <package>
# apt-get --force-yes remove <package>

# dpkg
# install
# dpkg -i <package>
# remove
# dpkg -r <package>
# purge
# dpkg -P <package>


# NETWORK
# auto eth[]
# allow-hotplug eth[]
# iface eth[] inet static
#	address
#	netmask
#	gateway
#	dns-search
#	dns-nameservers



# Parametrização
DRIVE_C="DRIVE_C"
DOMAIN_ALIASES="DMN"
DEFAULT_REALM=DOMAIN.COM
DOMAIN_DC="dc=domain,dc=com" #your dc
HOST_REALM="serverdmn.domain.com" # your domain
USER_REALM="ldapuser"
USER_REALM_PASS="yourpasword"
HOSTNAME=`hostname`
HOSTIP=`ip addr | grep inet | grep eth | cut -d" " -f6 | cut -d/ -f1 | tac | tail -n1`
SERVER_FILE="192.168.0.?" # your server file ip
SERVER_DOMAIN="192.168.0.?" # your server Active Directory
SCRIPTPATH="smb://$SERVER_FILE/netlogonlnx$" # share with scripts logins
ACCOUNTNAME=$USER
CODENAME=`cat /etc/lsb-release | grep CODENAME | cut -d= -f2`
#CODENAME="trusty"
ARCH=`uname -m`
JAVA_VERSION="9"
LDAPUSER=usrlnx@domain.com
LDAPPASS=Password123 # password for user apply customizations
LDAPACCOUNTNAME=$USER
LDAPDMN=dmn #your domain name
INTERFACE=`ifconfig | grep eth | cut -f1 -dL`
DCONF=`which dconf`
NTP_SERVER="192.168.0.?" # your ntp server
NETWORK=$(sudo ifconfig | grep inet | cut -d ':' -f2 | cut -d 'B' -f1 | cut -d 'M' -f1 | cut -d '.' -f3 | head -n1)


# ---------------------------------------------------------------------------------------------------------------
# |	Encriptar script: shc -v -r -f <script>									|
# ---------------------------------------------------------------------------------------------------------------



# [..Tip 1]
tip_locks(){

 clear
 printf '\n\nMost screen crashes occur due to instabilities in standard video packages.\n'
 printf '\nEspecially on older machines.\n'
 printf '\n'
 printf '.."Nouveau Kernel Driver" with bug xorg...................................................................\n'
 printf '\n'
 printf '  Graphic processing Xorg reaches 100% interrupting graphic mode and locking the screen\n'
 printf ' 													  \n'
 printf '  Add module in /etc/modprobe.d/blacklist.conf							  \n'
 printf '  blacklist nouveau											  \n'
 printf '  options nouveau modeset=0										  \n'
 printf ' 													  \n'
 printf '  apt-get --purge remove xserver-xorg-video-nouveau							  \n'
 printf '  update-initramfs -u											  \n'
 printf '  reboot												  \n'
 printf '\n\n\n'
 printf 'For installation on 8MB memory cards, run the SAFE MODE installation mode\n\n'
 printf 'After installation edit the file /etc/X11/xorg.conf\n\n'
 printf 'Add the following lines:\n'
 printf 'DefaultDepth \t16\n'
 printf 'SubSection "Display"\n'
 printf '\tDepth	\t1\n'
 printf '\tModes	\t"1024x768" "800x600"\n'
 printf 'EndSubSection\n'
 printf '\nReiniciar o servidor X:\n\n'
 printf 'sudo /etc/init.d/lightdm restart\n\n'
 printf '.........................................................................................................\n'
 printf '\n'

 printf '\n\n\n'
 printf 'Xorg -configure\n' 
 printf 'startx\n'
 printf 'Xorg -config -retro'

}



# [..Tip 2]
tip_gpumanager(){

 clear
 printf '.........................................................................................................\n'
 printf '  gpu-manager - controls and overrides xorg.conf \n'
 printf '  /etc/init/gpu-manager.conf										  \n'
 printf '.........................................................................................................\n'
 printf '\n'

}



# [..Tip 3]
tip_recovery(){

 clear
 printf '.........................................................................................................\n'
 printf '  Boot recovery mode											  \n'
 printf '  Mount as rw											  \n'
 printf '  mount -o remount,rw /										  \n'
 printf '.........................................................................................................\n'
 printf '\n'

}



# [..Tip 4]
tip_domainconfig(){

 clear
 printf '.........................................................................................................\n'
 printf ' 	REALM KERBEROS:				 			DOMAIN.COM		  \n'
 printf ' 	Should debconf manage LDAP configuration?	 		YES				  \n'
 printf ' 	LDAP server Uniform Resource Identifier:	 		ldaps://192.168.0.?		  \n'
 printf ' 	Distinguished name of the search base:	 			dc=domain,dc=com	  \n'
 printf ' 	LDAP version to use:				 		3				  \n'
 printf ' 	Make local root Database admin:		 			No				  \n'
 printf ' 	Does the LDAP database require login?		 		No				  \n'
 printf ' 	*** request-key.conf (Y/I/N/O/D/Z) [default=N] ? 		Y				  \n'
 printf ' 	Overwrite local modifications of /etc/pam.d/common-*? 	Y				  \n'
 printf '.........................................................................................................\n'
 printf '\n'

}



# [..Tip 5]
tip_strace(){

 clear
 printf '.........................................................................................................\n'
 printf '  Trace files executed by a particular program at run time				  \n'
 printf '  strace [program] 2>&1 										  \n'
 printf '.........................................................................................................\n'
 printf '\n'

}



tip.Tip 6]
tip_padronizacao(){

 clear
 printf '.........................................................................................................\n'
 printf 'Dados para padronização das máquinas:									\n\n'
 printf '\tUsuário padrão: \tnix											  \n'
 printf '\tHostname padrão: \tpmtlnx-[000000]									  \n'
 printf '\n'
 printf 'Levantar as informações: \n'
 printf '\t\t\t\tMAC ADDRESS (ex.: 00:00:00:00:00:00) \n'
 printf '\t\t\t\tIP (ex.: 000.000.000.000) \n'	
 printf '.........................................................................................................\n'
 printf '\n'

}



# [..Tip 7]
tip_networkconfiguration() {

 clear
 printf 'Configuração para placa de rede (/etc/network/interfaces\n\n'
 printf '\tauto eth0\n'
 printf '\tallow-hotplug eth[0,1,2...]\n'
 printf '\tiface eth0 inet dhcp\n'

}



tip_ubuntuversion() {

 clear
 printf '17.1	Rebecca	Ubuntu Trusty	Long term support release (LTS), supported until April 2019.'
 printf '17	Qiana	Ubuntu Trusty	Long term support release (LTS), supported until April 2019.'
 printf '13	Maya	Ubuntu Precise	Long term support release (LTS), supported until April 2017.'
 printf '2	Betsy	Debian Jessie	Long term support release (LTS).'

}



tip_livecommand() {

 clear
 printf 'Executar um comando periodicamente mostrando resultados em tempo real: por exemplo\n\n'
 printf 'watch -n 1 "ls -l /home"'
 printf '\n\nIrá mostra a saída do comando ls a cada 1s\n\n'

}



tip_vnc(){
 clear
 printf 'Porta padrão para acesso vnc:\n\n'
 printf 'Porta 2\n\n'
 printf 'Exemplo:\n\n'
 printf '192.168.0.10:2\n\n'
}



tip_printer(){
 clear 
 printf 'Editar o arquivo /usr/lexscan/etc/scan.conf\n\n'
 printf 'Localizar a linha IPADDRESS\n\n'
 printf 'Informar o IP da printer scanner\n\n'
 printf 'Salvar o arquivo\n\n'
 printf 'Reiniciar o servidor de impressão:\n\n'
 printf 'sudo /etc/init.d/cups restart\n\n\n'
 
 printf 'Listar printer\n'
 printf 'lpstat -v\n\n'

 printf 'Testar printer\n'
 printf 'ls -l | lpr -P <nome_da_printer>\n\n'

 printf 'Arquivo de configuração de printer: /etc/cups/printers.conf'

}



tip_video(){
 clear
 printf 'Máquinas com driver de vídeo Intel (i915 e similares) e ATI XL e similares\n\n'
 printf 'echo "blacklist=i915" >>/etc/modprobe.d/blacklist.conf\n'
 printf 'sudo apt-get remove xserver-xorg-video-intel\n'
 printf 'sudo apt-get install xserver-xorg-video-vesa\n'
 printf 'Padrão 1280x1024 para Intel\n'
 printf 'Padrão 1024x768 para ATI\n\n'
 
 printf 'Script xrandr.sh em /opt\n'
 printf 'Arquivo lightdm.conf com opção display-setup-script\n\n'

 printf 'Ajustes podem ser feitos no arquivo /etc/X11/xorg.conf\n'
 printf 'e\n'
 printf '/opt/xrandr.sh\n\n'

 printf 'Usar o comando cvt 1280 1024\n'
 printf 'para detectar os valores corretos para configurações gráficas\n\n'

 printf 'xresprobe\n'
 printf 'ddcprobe | grep monitorrange\n\n'

 printf '\n\n\n'
 printf 'How to disable monitor detection\n'
 printf 'Force xorg to use specific monitor resolution / disable DDC\n\n'
 printf ' Advanced Micro Devices, Inc. [AMD/ATI] Rage XL PCI\n'
 printf 'xorg.conf\n'
 printf 'Section Device\n'
 printf 'Driver vesa\n'
 printf '\n'
 printf 'Add to your monitor section line\n'
 printf 'Section Monitor\n'
 printf 'Option "DDC" "False"\n'


}


tip_usbip(){
	clear
	printf 'Usbip permite que dispositivos USB storage sejam mapeados em uma máquina remota.\n\n'
	printf 'Possui dois módulos:\n\n'
	printf 'Cliente  --> para à maquina que terá o dispositivo usb plugado.\n\n'
	printf 'Servidor --> para à máquina que irá mapear o dispositivo usb remoto.\nAcessível através de ActiveDirectory Manager.\nMenu-->Ferramentas-->Usbip.\n\n'
	printf 'Na máquina (ActiveDirectory Manager) que irá mapear o disposito usb os seguintes comandos são necessários:\n\n'
	printf '1 ---> apt-get install linux-tools-generic\n\n'
	printf '2 ---> modprobe vhci-hcd\n\n'
	printf '3 ---> echo 'vhci-hcd' >> /etc/modules\n\n'
	printf 'Com o comando "./config.sh.x usbip", o módudo cliente será instalado na máquina cliente em /tmp\n\n'
	printf 'Após isso utilizar o ActiveDirectory Manager Menu->Ferramentas->Usbip para acessar o dispositivo remoto.\nUma nova unidade removível será apresentada no gerenciador de arquivos preferido.\n'
	printf 'Acessível através de gerenciadores de arquivos como Dolphin,Caja,Thunar,etc.\n\n'
}


# [...info...]
info(){

 clear
 echo "Desenvolvedor: Fabricio Eduardo Loose"
 echo "Data:          19/08/2014"
 echo "Descrição:     Personalização ambiente MATE para máquina cliente"
 

}



# [...Atualiza repositorios da maquina cliente...]
sources(){

 rm -rf /etc/apt/sources.list.d/*

 echo "Updating mirrors..."

 # repository apt internal necessary
 echo "deb http://aptmirror.domain.com $CODENAME main contrib non-free" >/etc/apt/sources.list
 echo "" >>/etc/apt/sources.list

 echo "#deb http://br.archive.ubuntu.com/ubuntu/ $CODENAME main restricted" >>/etc/apt/sources.list
 echo "#deb-src http://br.archive.ubuntu.com/ubuntu/ $CODENAME main restricted" >>/etc/apt/sources.list
 echo "" >>/etc/apt/sources.list

 echo "#deb http://br.archive.ubuntu.com/ubuntu/ $CODENAME-updates main restricted" >>/etc/apt/sources.list
 echo "#deb-src http://br.archive.ubuntu.com/ubuntu/ $CODENAME-updates main restricted" >>/etc/apt/sources.list
 echo "" >>/etc/apt/sources.list

 echo "#deb http://br.archive.ubuntu.com/ubuntu/ $CODENAME universe" >>/etc/apt/sources.list
 echo "#deb-src http://br.archive.ubuntu.com/ubuntu/ $CODENAME universe" >>/etc/apt/sources.list
 echo "" >>/etc/apt/sources.list

 echo "#deb http://br.archive.ubuntu.com/ubuntu/ $CODENAME-updates universe" >>/etc/apt/sources.list
 echo "#deb-src http://br.archive.ubuntu.com/ubuntu/ $CODENAME-updates universe" >>/etc/apt/sources.list
 echo "" >>/etc/apt/sources.list

 echo "#deb http://br.archive.ubuntu.com/ubuntu/ $CODENAME multiverse" >>/etc/apt/sources.list
 echo "#deb-src http://br.archive.ubuntu.com/ubuntu/ $CODENAME multiverse" >>/etc/apt/sources.list
 echo "" >>/etc/apt/sources.list

 echo "#deb http://br.archive.ubuntu.com/ubuntu/ $CODENAME-updates multiverse" >>/etc/apt/sources.list
 echo "#deb-src http://br.archive.ubuntu.com/ubuntu/ $CODENAME-updates multiverse" >>/etc/apt/sources.list
 echo "" >>/etc/apt/sources.list

 echo "#deb http://br.archive.ubuntu.com/ubuntu/ $CODENAME-backports main restricted universe multiverse" >>/etc/apt/sources.list
 echo "#deb-src http://br.archive.ubuntu.com/ubuntu/ $CODENAME-backports main restricted universe multiverse" >>/etc/apt/sources.list
 echo "" >>/etc/apt/sources.list

 echo "#deb http://security.ubuntu.com/ubuntu $CODENAME-security main restricted" >>/etc/apt/sources.list
 echo "#deb-src http://security.ubuntu.com/ubuntu $CODENAME-security main restricted" >>/etc/apt/sources.list
 echo "" >>/etc/apt/sources.list

 echo "#deb http://security.ubuntu.com/ubuntu $CODENAME-security universe" >>/etc/apt/sources.list
 echo "#deb-src http://security.ubuntu.com/ubuntu $CODENAME-security universe" >>/etc/apt/sources.list
 echo "" >>/etc/apt/sources.list

 echo "#deb http://security.ubuntu.com/ubuntu $CODENAME-security multiverse" >>/etc/apt/sources.list
 echo "#deb-src http://security.ubuntu.com/ubuntu $CODENAME-security multiverse" >>/etc/apt/sources.list
 echo "" >>/etc/apt/sources.list

 echo "#deb http://archive.canonical.com/ubuntu $CODENAME partner" >>/etc/apt/sources.list
 echo "#deb-src http://archive.canonical.com/ubuntu $CODENAME partner" >>/etc/apt/sources.list
 echo "" >>/etc/apt/sources.list

 echo "#deb http://extras.ubuntu.com/ubuntu $CODENAME main" >>/etc/apt/sources.list
 echo "#deb http://archive.canonical.com/ $CODENAME partner" >>/etc/apt/sources.list
 echo "" >>/etc/apt/sources.list

 echo "#deb http://download.jitsi.org/deb unstable/" >>/etc/apt/sources.list
 echo "" >>/etc/apt/sources.list

 echo "#NVIDIA: /etc/apt/sources.list.d/nvidia.list" >>/etc/apt/sources.list
 echo "" >>/etc/apt/sources.list
 echo "#deb http://ppa.launchpad.net/xorg-edgers/ppa/ubuntu $CODENAME main" >>/etc/apt/sources.list.d/nvidia.list
 echo "#deb-src http://ppa.launchpad.net/xorg-edgers/ppa/ubuntu $CODENAME main" >>/etc/apt/sources.list.d/nvidia.list

 # MATE
 # add mate via ppa
 # apt-add-repository ppa:ubuntu-mate-dev/ppa -y"
 # apt-add-repository ppa:ubuntu-mate-dev/trusty-mate
 echo "#MATE: :/etc/apt/sources.list.d/mate.list" >>/etc/apt/sources.list
 echo "" >>/etc/apt/sources.list
 echo "#deb http://ppa.launchpad.net/ubuntu-mate-dev/$CODENAME-mate/ubuntu $CODENAME main" >>/etc/apt/sources.list.d/mate.list
 echo "#deb-src http://ppa.launchpad.net/ubuntu-mate-dev/$CODENAME-mate/ubuntu $CODENAME main" >>/etc/apt/sources.list.d/mate.list
 
 # JAVA
 #add-apt-repository ppa:webupd8team/java -y && apt-get update
 echo "#JAVA: /etc/apt/sources.list.d/java.list" >>/etc/apt/sources.list
 echo "" >>/etc/apt/sources.list
 echo "#deb http://ppa.launchpad.net/webupd8team/java/ubuntu $CODENAME main" >>/etc/apt/sources.list.d/java.list
 echo "#deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu $CODENAME main" >>/etc/apt/sources.list.d/java.list

 # FIREFOX: /etc/apt/sources.list.d/firefox.list
 #gpg --keyserver pgpkeys.mit.edu --recv-key EF4186FE247510BE 
 #gpg -a --export EF4186FE247510BE | apt-key add -
 echo "#FIREFOX: /etc/apt/sources.list.d/firefox.list" >>/etc/apt/sources.list
 echo "" >>/etc/apt/sources.list
 echo "#deb http://ppa.launchpad.net/ubuntu-mozilla-daily/ppa/ubuntu $CODENAME main" >>/etc/apt/sources.list.d/firefox.list
 echo "#deb-src http://ppa.launchpad.net/ubuntu-mozilla-daily/ppa/ubuntu $CODENAME main" >>/etc/apt/sources.list.d/firefox.list

 # CHOME: /etc/apt/sources.list.d/chrome.list
 echo "#CHOME: /etc/apt/sources.list.d/chrome.list" >>/etc/apt/sources.list
 echo "" >>/etc/apt/sources.list
 echo "#deb http://dl.google.com/linux/chrome/deb/ stable main" >>/etc/apt/sources.list.d/chrome.list

 # WPS-OFFICE: /etc/apt/sources.list.d/wps.list
 echo "#WPS OFFICE: /etc/apt/sources.list.d/wps.list" >>/etc/apt/sources.list
 echo "" >>/etc/apt/sources.list
 echo "#deb http://repo.uniaolivre.com/packages trusty main" >>/etc/apt/sources.list.d/wps.list


 apt-get update

}



# [...Install ssh-server on client machine for ssh access support
ssh(){	

 echo "{+...Install openssh-server"
 apt-get install vim openssh-server -y --force-yes

}



# [...install...gnome-fallback, add repo mate, install libs, install fonts, install mozo for wine, install nfsclient...]
install(){

 echo "{+...Install openssh-server"
 apt-get install openssh-server vim -y --force-yes

 echo "[+...Install gnome fallback...]"
# apt-get install gnome-session-fallback -y --force-yes
# apt-get install indicator-applet-appmenu -y --force-yes
# apt-get install gnome-tweak-tool -y --force-yes

 echo "[+...Install samba, kerberos...]"
 apt-get install libpam-krb5 krb5-user smbclient -y --force-yes

# echo "[+...Install mate desktop...]"
# apt-get install --no-install-recommends mate-core mate-desktop-environment mate-notification-daemon -y --force-yes #--force-yes in case of an error in the installation of mate

 echo "[+...Install flashplugin...]"
 apt-get install pepperflashplugin-nonfree -y --force-yes

 echo "[+...Install extra packages multimedia codecs..."
 apt-get install ubuntu-restricted-extras -y --force-yes
 apt-get install libdvdread4 -y --force-yes
 sh /usr/share/doc/libdvdread4/install-css.sh

 echo "[+...Install rar and other archiving utilities...]"
 apt-get install unace p7zip-rar sharutils rar arj lunzip lzip -y --force-yes

 echo "[+...Install Droid and Noto fonts...]"
 apt-get install fonts-droid fonts-noto -y --force-yes

 echo "[+...Install a clipboard manager...]"
 apt-get install glipper -y --force-yes

 echo "[+...Install nfs client...]"
 apt-get install nfs-client -y --force-yes

 echo "[+...Install mozo mate perso menu...]"
 apt-get install python-support python-mate-menu -y --force-yes
 smbget smb://$SERVER_FILE/netlogonlnx$/mozo_1.8.0-1~unofficial_all.deb -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 dpkg -i mozo_1.8.0-1~unofficial_all.deb
 rm mozo_1.8.0-1~unofficial_all.deb

 echo "[+...Install linux_logo...]"
 apt-get install linuxlogo -y --force-yes
 echo "-L ubuntu" >/etc/linux_logo.conf 
 echo "" >>/etc/profile && echo "linux_logo" >>/etc/profile

 echo "[+...setting up skel...]"
 rm /etc/skel/examples.desktop 

 echo "Yet Another Dialog - dialogs for shell"
 smbget smb://$SERVER_FILE/netlogonlnx$/apps/yad_0.25.1-1_$ARCH.deb -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 dpkg -i yad_0.25.1-1_$ARCH.deb
 rm -rf yad_0.25.1-1_$ARCH.deb


 echo "[+...Install vnc4server...]"
 apt-get install vnc4server x11vnc xinetd -y --force-yes


 echo "[+...Multimedia install...]"
 apt-get install vlc -y --force-yes


 echo "[+...Install MasterPDFEditor...]"
 smbget smb://$SERVER_FILE/netlogonlnx$/apps/MasterPDFEditor.$ARCH.tar.gz -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 tar zxvf MasterPDFEditor.$ARCH.tar.gz
 mv MasterPDFEditor /opt -f
 chmod 777 -R /opt/MasterPDFEditor
 smbget smb://$SERVER_FILE/netlogonlnx$/apps/master-pdf-editor.desktop -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 mv master-pdf-editor.desktop /usr/share/applications -f


 echo "[+]...Installing Libreoffice base...]"
 sudo apt-get install libreoffice-base -y --force-yes


 echo "[+]...Installing translate for LibreOffice...]" # my case pt-br
 apt-get install libreoffice-l10n-pt-br myspell-pt-br expect -y --force-yes


 echo "[+] Installing numlockx for lightdm..."
 apt-get install numlockx -y --force-yes


 echo "[+] Installing psi..."
 apt-get install psi psi-translations -y --force-yes


 echo "[+] Installing f-spot..."
 apt-get install f-spot -y --force-yes


 echo "[+] Installing printer pdf..."
 apt-get install cups-pdf -y --force-yes

 echo "[+] Installing gscan2pdf..."
 apt-get install gscan2pdf tesseract-ocr-por -y --force-yes

 # installing wpsoffice
 wpsoffice

 # client rdesktop
 ativarrdp

 # enable webcups manager
 cups

 # enable session guest
 #guestsession


 # Ubuntu-Mate-LTS-14.04.2 ----------------------------------------------
 rm -rf /usr/share/applications/blueman-manager.desktop 
 rm -rf /usr/share/applications/qtconfig-qt4.desktop 
 rm -rf /usr/share/applications/gufw.desktop 
 rm -rf /usr/share/applications/mate-tweak.desktop 
 rm -rf /usr/share/applications/lightdm-gtk-greeter-settings.desktop
 rm -rf /usr/share/applications/hexchat.desktop
 rm -rf /usr/share/applications/pidgin.desktop 
 
 # remove applet indicator (bluethoot,etc)
 apt-get purge indicator-application -y --force-yes
 apt-get purge blueman -y --force-yes
 # Ubuntu-Mate-LTS-14.04.2 ----------------------------------------------

 # remove ntp server
 ntp

 apt-get autoremove

 # resets the session to apply settings
 service lightdm restart

 
 mv /etc/ssh/sshd_config /etc/ssh/sshd_config.old -f
 sed s/'PermitRootLogin without-password'/'PermitRootLogin yes'/g /etc/ssh/sshd_config.old >/etc/ssh/sshd_config
 rm /etc/ssh/sshd_config.old

}



# [...Config vnc on client...]
vncconfig(){
 echo "[+...Installing files configuration vnc on client...]"	
 smbget smb://$SERVER_FILE/netlogonlnx$/1404LAB/Xvnc -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 smbget smb://$SERVER_FILE/netlogonlnx$/1404LAB/x11vnc.conf -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 smbget smb://$SERVER_FILE/netlogonlnx$/1404LAB/.vncpasswd -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 mv Xvnc /etc/xinetd.d/ -f
 mv .vncpasswd /etc -f
 mv x11vnc.conf /etc/init/ -f
}



# [...Install printer LExmark drivers...]
printer(){
 echo "[+...Install sane for Lexmark printers...]"
 smbget smb://$SERVER_FILE/netlogonlnx$/drivers/lexmark-PPD-Files-LXAEN-1.2-1.$ARCH.deb -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 smbget smb://$SERVER_FILE/netlogonlnx$/drivers/network-scan-linux-glibc2-$ARCH.deb -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 dpkg -i lexmark-PPD-Files-LXAEN-1.2-1.$ARCH.deb 
 dpkg -i network-scan-linux-glibc2-$ARCH.deb
 rm -rf lexmark-PPD-Files-LXAEN-1.2-1.$ARCH.deb 
 rm -rf network-scan-linux-glibc2-$ARCH.deb
 apt-get install sane xsane -y --force-yes

 tip_printer
}


# [...Install printer LExmark drivers...]
epson(){
 echo "[+...Install epson printer drivers...]"
 #smbget smb://$SERVER_FILE/netlogonlnx$/drivers/lexmark-PPD-Files-LXAEN-1.2-1.$ARCH.deb -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 smbget smb://$SERVER_FILE/netlogonlnx$/drivers/epson/epson-inkjet-printer-escpr_$ARCH.deb -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 smbget smb://$SERVER_FILE/netlogonlnx$/drivers/epson/epson-printer-utility_$ARCH.deb -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 
 dpkg -i epson-inkjet-printer-escpr_$ARCH.deb
 dpkg -i epson-printer-utility_$ARCH.deb

 #rm -rf lexmark-PPD-Files-LXAEN-1.2-1.$ARCH.deb 
 #rm -rf network-scan-linux-glibc2-$ARCH.deb

 /etc/init.d/cups restart

}


# [...Install java oracle...]
java(){

 if [ ! -d /usr/lib/jvm ]
 then
	mkdir -p /usr/lib/jvm
 fi

 if [ ! -d /opt/google/chrome/plugins ]
 then
	mkdir -p /opt/google/chrome/plugins
 fi

 if [ ! -d /usr/lib/mozilla/plugins ]
 then
	mkdir -p /usr/lib/mozilla/plugins
 fi

 smbget smb://$SERVER_FILE/netlogonlnx$/java/jdk/jdk.tar.gz -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 # tar xvf jdk.tar.gz -C /usr/lib/jvm/
 tar xvf jdk.tar.gz
 rm -rf jdk.tar.gz
 rm -rf /usr/lib/jvm/jdk
 mv jdk* jdk
 mv jdk /usr/lib/jvm/


 # create CHROME link
 ln -s /usr/lib/jvm/jdk/jre/lib/i386/libnpjp2.so /opt/google/chrome/plugins/ -f

 # create FIREFOX link
 ln -s /usr/lib/jvm/jdk/jre/lib/i386/libnpjp2.so /usr/lib/mozilla/plugins -f

 # Variables PATH
 sed -i '/J2SDKDIR/d' /etc/profile
 echo "export J2SDKDIR=/usr/lib/jvm/jdk" >>/etc/profile

 sed -i '/J2REDIR/d' /etc/profile
 echo "export J2REDIR=/usr/lib/jvm/jdk/jre" >>/etc/profile

 sed -i '/PATH/d' /etc/profile
 echo "export PATH=$PATH:/usr/lib/jvm/jdk/bin:/usr/lib/jvm/jdk/db/bin:/usr/lib/jvm/jdk/jre/bin" >>/etc/profile

 sed -i '/JAVA_HOME/d' /etc/profile
 echo "export JAVA_HOME=/usr/lib/jvm/jdk" >>/etc/profile

 sed -i '/DERBY_HOME/d' /etc/profile
 echo "export DERBY_HOME=/usr/lib/jvm/jdk/db" >>/etc/profile

 sed -i '/JRE_HOME/d' /etc/profile
 echo "export JRE_HOME=/usr/lib/jvm/jdk/jre" >>/etc/profile

 
 printf 'Getting file .desktop for icon.\n'
 smbget smb://$SERVER_FILE/netlogonlnx$/java/java-controlpanel.desktop -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 mv java-controlpanel.desktop /usr/share/applications/ -f


 echo "Updating links references..."
 update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk/jre/bin/java 1
 update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk/bin/javac 1
 update-alternatives --install /usr/bin/javaws javaws /usr/lib/jvm/jdk/jre/bin/javaws 1

 update-alternatives --set java /usr/lib/jvm/jdk/jre/bin/java
 update-alternatives --set javac /usr/lib/jvm/jdk/bin/javac
 update-alternatives --set javaws /usr/lib/jvm/jdk/jre/bin/javaws

}



# [...Install Google Chrome...]
chrome(){
 #wget -q -O – https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
 #echo deb http://dl.google.com/linux/chrome/deb/ stable main > /etc/apt/sources.list.d/google.list
 #apt-get update
 apt-get install google-chrome-stable -y --force-yes
}



# [...Install Mozilla Firefox...]
firefox(){

 apt-get update
 apt-get install firefox -y --force-yes

}



# [...Personalização para lightdm...]
lightdmconfig(){


 CHECK=$( which mate-about )

 echo "[+...Check Window Manager Mate...]"
 
 #if [ $CHECK == "/usr/bin/mate-about" ]; then

 #   echo "[+...Obtendo lightdm.conf.mate...]"
 #   smbget smb://$SERVER_FILE/netlogonlnx$/lightdm.conf.mate -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 #   mv lightdm.conf.mate lightdm.conf -f	

 #else

    echo "[+...Getting lightdm.conf...]"
    smbget smb://$SERVER_FILE/netlogonlnx$/1404LAB/lightdm.conf -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS

 #fi


 mv lightdm.conf /etc/lightdm/ -f

 echo "[-...disable session entries in lightdm...]"
 sudo cp -vR /usr/share/xsessions /usr/share/xsessions.orig
 sudo rm -rf /usr/share/xsessions/*
 sudo cp /usr/share/xsessions.orig/mate.desktop /usr/share/xsessions/
 sudo rm -rf /usr/share/xsessions.orig


 # Clear sessions previous logons
 rm -rf /var/cache/lightdm/dmrc/*


 # Remove ubuntu session, otherwise it will generate an ubuntu session error not found
 echo "...Remove session ubuntu..."
 rm /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf 

 #<--
 #lightdmbackground
 #-->

 #<--
 guestsession
 #-->

 service lightdm restart

}



lightdmbackground(){
 echo "[+...Changes the background of the login screen...]"
 
 smbget smb://$SERVER_FILE/netlogonlnx$/warty-final-ubuntu.png -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 mv warty-final-ubuntu.png /usr/share/backgrounds/ -f
 chmod 644 /usr/share/backgrounds/warty-final-ubuntu.png

 smbget smb://$SERVER_FILE/netlogonlnx$/com.canonical.unity-greeter.gschema.xml -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 mv com.canonical.unity-greeter.gschema.xml /usr/share/glib-2.0/schemas/ -f
 glib-compile-schemas /usr/share/glib-2.0/schemas/

 
}




# [...Configuration to join the Active Directory domain...]
domainconfig(){

 ntpdate $SERVER_FILE

 # DNS configuration
 resolvconf --disable-updates

 # install ldap requeriments nss and pam ldap
 #apt-get install libpam-krb5 krb5-user libpam-ccreds smbclient winbind libpam-winbind libnss-winbind cifs-utils libpam-shishi ldap-utils libnss-ldap libpam-ldap libpam-mount -y --force-yes
 apt-get install libpam-krb5 krb5-user libpam-ccreds smbclient winbind libpam-winbind libnss-winbind cifs-utils ldap-utils libpam-mount -y --force-yes
 #apt-get install libpam-krb5 krb5-user libpam-ccreds smbclient winbind libpam-winbind libnss-winbind cifs-utils -y --force-yes
 echo "apt-get install libpam-krb5 krb5-user libpam-ccreds smbclient winbind libpam-winbind libnss-winbind cifs-utils ldap-utils libpam-mount -y --force-yes"


 DIR=`pwd`
 cd $DIR
 # Install krb5 and copy conf files in PMTSERVER01
 #smbget smb://$SERVER_FILE/netlogonlnx$/1404LAB/head -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 #cp $DIR/head /etc/resolvconf/resolv.conf.d/head -f

 smbget smb://$SERVER_FILE/netlogonlnx$/1404LAB/krb5.conf -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 cp $DIR/krb5.conf /etc/ -f

 smbget smb://$SERVER_FILE/netlogonlnx$/1404LAB/smb.conf -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 cp $DIR/smb.conf /etc/samba/ -f

 smbget smb://$SERVER_FILE/netlogonlnx$/1404LAB/nsswitch.conf -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 cp $DIR/nsswitch.conf /etc/ -f

 smbget smb://$SERVER_FILE/netlogonlnx$/1404LAB/request-key.conf -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 cp $DIR/request-key.conf /etc/ -f

 smbget smb://$SERVER_FILE/netlogonlnx$/1404LAB/common-auth -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 cp $DIR/common-auth /etc/pam.d/ -f

 smbget smb://$SERVER_FILE/netlogonlnx$/1404LAB/common-account -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 cp $DIR/common-account /etc/pam.d/ -f

 smbget smb://$SERVER_FILE/netlogonlnx$/1404LAB/common-session -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 cp $DIR///common-session /etc/pam.d/ -f

 smbget smb://$SERVER_FILE/netlogonlnx$/1404LAB/common-password -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 cp $DIR/common-password /etc/pam.d/ -f

 #smbget smb://$SERVER_FILE/netlogonlnx$/1404LAB/ldap.conf -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 #cp $DIR/ldap.conf /etc/ -f

 smbget smb://$SERVER_FILE/netlogonlnx$/1404LAB/hosts -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 cp $DIR/hosts /etc/ -f

 # Remove arquivos recebidos
 # rm ldap.conf common-password common-session common-account common-auth request-key.conf nsswitch.conf smb.conf krb5.conf head hosts
 rm common-password common-session common-account common-auth request-key.conf nsswitch.conf smb.conf krb5.conf hosts

 # Atualiza arquivo /etc/samba/smb.conf com hostname do host local
 mv /etc/samba/smb.conf /etc/samba/smb.conf.old -f && sed s/'P_HOSTNAME'/''$HOSTNAME''/g /etc/samba/smb.conf.old >/etc/samba/smb.conf && rm -rf /etc/samba/smb.conf.old
 mv /etc/samba/smb.conf /etc/samba/smb.conf.old -f && sed s/'P_DOMAIN'/''$DOMAIN_ALIASES''/g /etc/samba/smb.conf.old >/etc/samba/smb.conf && rm -rf /etc/samba/smb.conf.old
 mv /etc/samba/smb.conf /etc/samba/smb.conf.old -f && sed s/'P_REALM'/''$DEFAULT_REALM''/g /etc/samba/smb.conf.old >/etc/samba/smb.conf && rm -rf /etc/samba/smb.conf.old

 # Atualiza arquivo /etc/hosts com hostname e ip do host local
 mv /etc/hosts /etc/hosts.old -f && sed s/'P_HOSTNAME'/''$HOSTNAME''/g /etc/hosts.old >/etc/hosts && rm -rf /etc/hosts.old
 mv /etc/hosts /etc/hosts.old -f && sed s/'P_HOSTIP'/''$HOSTIP''/g /etc/hosts.old >/etc/hosts && rm -rf /etc/hosts.old


 # Atualiza arquivo /etc/krb5.conf com REALM padrao
 mv /etc/krb5.conf /etc/krb5.conf.old -f && sed s/'P_REALMDOMAIN'/''`echo $DEFAULT_REALM | tr '[:upper:]' '[:lower:]'`''/g /etc/krb5.conf.old >/etc/krb5.conf && rm -rf /etc/krb5.conf.old
 mv /etc/krb5.conf /etc/krb5.conf.old -f && sed s/'P_REALM'/''`echo $DEFAULT_REALM | awk '{print tolower($0)}'`''/g /etc/krb5.conf.old >/etc/krb5.conf && rm -rf /etc/krb5.conf.old
 mv /etc/krb5.conf /etc/krb5.conf.old -f && sed s/'P_1'/''$DEFAULT_REALM''/g /etc/krb5.conf.old >/etc/krb5.conf && rm -rf /etc/krb5.conf.old
 mv /etc/krb5.conf /etc/krb5.conf.old -f && sed s/'P_2'/''$DEFAULT_REALM''/g /etc/krb5.conf.old >/etc/krb5.conf && rm -rf /etc/krb5.conf.old
 mv /etc/krb5.conf /etc/krb5.conf.old -f && sed s/'P_3'/''$DEFAULT_REALM''/g /etc/krb5.conf.old >/etc/krb5.conf && rm -rf /etc/krb5.conf.old
 mv /etc/krb5.conf /etc/krb5.conf.old -f && sed s/'P_HOSTREALM'/''$HOST_REALM''/g /etc/krb5.conf.old >/etc/krb5.conf && rm -rf /etc/krb5.conf.old


 # Create ticket - KERBEROS
 #kinit $USER_REALM@$DEFAULT_REALM
 echo $USER_REALM_PASS | kinit $USER_REALM@$DEFAULT_REALM

 # Join to Domain Active Directory
 #net ads join -U $USER_REALM%$USER_REALM_PASS
 net ads join -S $LDAPDMN -U $USER_REALM%$USER_REALM_PASS -d 1
 #net ads join member -k -S serverdmn.domain.com -U $USER_REALM%$USER_REALM_PASS -d 1


 # Restart winbind and samba service
 #/etc/init.d/winbind restart && /etc/init.d/samba restart 
 service winbind restart && service smbd restart
 

 # Create keytab file KERBEROS
 net ads keytab create
 #net ads keytab create -U $USER_REALM%$USER_REALM_PASS 
 #chmod 600 /etc/krb5.keytab
 #klist -e -k /etc/krb5.keytab


 # Test keytab KERBEROS
 kinit -V -k `hostname | awk '{print toupper($0)}'`$

 # Windows Active Directory registry machine
 #ktpass.exe /princ "host/lnx-winelab.domain.com@DOMAIN.COM" /mapuser lnx-winelab$@ODMAIN.COM

 # Valid machine account
 kinit -V -k host/''$HOSTNAME'.'`echo $DEFAULT_REALM | awk '{print tolower($0)}'`'@'$DEFAULT_REALM''

 #Add to cron, generate auto key machine
 echo "0 * * * * kinit -k host/'$HOSTNAME.'`echo $DEFAULT_REALM | awk '{print tolower($0)}'`'@'$DEFAULT_REALM'' -c /tmp/krb5cc_host; chmod +r /tmp/krb5cc_host; setfacl -m u:nobody:--- /tmp/krb5cc_host; setfacl -m g:nogroup:--- /tmp/krb5cc_host" >/var/spool/cron/crontabs/root
 echo "" >>/var/spool/cron/crontabs/root
 klist -c /tmp/krb5cc_host

 # echo ldap test
 #ldapsearch "(cn=ldapuser)"

 # Test connection with base Ldap
 #getent passwd $USER_REALM

 # pam.d common-session configuration
 #echo "session optional pam_exec.so log=/var/log/logon /bin/sh /opt/wine.sh" >>/etc/pam.d/common-session

 # Enable lightdm script login/logout
 smbget smb://$SERVER_FILE/netlogonlnx$/1404LAB/lightdm.conf -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 mv lightdm.conf /etc/lightdm/ -f

 # Adiciona grupo grpunix para sudoers
 echo "`echo $LDAPDMN | tr '[:lower:]' '[:upper:]'`\\grpunixadmin	ALL=(ALL) ALL" >>/etc/sudoers
 echo "`echo $LDAPDMN | tr '[:lower:]' '[:upper:]'`\\grpunix	ALL=(ALL) ALL" >>/etc/sudoers

 # ativa apt-get remoto
 # echo "nix ALL=(ALL:ALL) NOPASSWD:/usr/bin/apt-get" >>/etc/sudoers

 printf "\nTestando conexão com AD...\n"
 net ads testjoin 

 printf "\nVerificando confiança entre hosts via RPC...\n"
 wbinfo -t

 printf "\nTeste de integração\n"
 #printf "\nContas\n"
 #net ads user
 #printf "\nGrupos\n"
 #net ads group
 #printf "\nUser info via net ads\n"
 #net ads user info ldapuser
 printf "\nUser info via wbinfo\n"
 wbinfo -i "`echo $LDAPDMN | tr '[:lower:]' '[:upper:]'`\ldapuser"


 #printf "\nUser info via getent\n"
 #getent passwd ldapuser


 printf "\nSamba cache files\n"  
 printf "\n/var/lib/samba/\n"
 ls -l /var/lib/samba/
 
 configscript

 lightdmconfig

}



# [...Limpeza samba cache domain files...]
domainclearcache(){

 /etc/init.d/winbind stop && /etc/init.d/samba stop
 net cache flush
 #rm -rf /var/lib/samba/*.tdb
 #rm -rf /var/lib/samba/group_mapping.ldb
 /etc/init.d/winbind start && /etc/init.d/samba start
 net cache list

}



# [...certificado digital...]
# Encontre através da caixa de seleção do Drivers disponível no caminho /usr/lib/libaetpkss.so.3
certificadodigital(){

 printf '[+...Installing certificado digital para Token USB...]\nTokens: Giesecke & Devrient GmbH,Certisign, GD Starsign (GB Burti)'

 #apt-get install opensc openssl libopensc-openssl pcscd pcsc-tools libccid libpcsclite1 openct libwxgtk2.8-0 libwxbase2.8-0 libtiff4 -y --force-yes
 apt-get install opensc openssl libopensc-openssl pcscd pcsc-tools libccid libpcsclite1 openct libwxgtk2.8-0 libwxbase2.8-0 -y --force-yes

 smbget smb://$SERVER_FILE/netlogonlnx$/tokens/32/safesignidentityclient.deb -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS 
 dpkg -i safesignidentityclient.deb 
 rm safesignidentityclient.deb


 printf '\n\n[+...Erro de biblioteca para autenticação....]\n'
 # Contribuição Hilario Vetore
 printf '\n\nCaso necessite localizar biblioteca para autenticação...informa a lib:\n'
 printf '/usr/lib/libaetpkss.so.3'

 echo "[-...Instalação concluída...]"

}



websigner(){
	printf '[+...Installing Assinatura Digital no Brownser - softplan - websigner - Firefox...'
	apt-get update && apt-get install firefox firefox-locale-pt
	 
	smb://$SERVER_FILE/netlogonlnx$/tokens/softplan/14.04/websigner-setup-$ARCH_ubuntu_14.04.deb -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS 	
	dpkg -i websigner-setup-$ARCH_ubuntu_14.04.deb
	rm websigner-setup-$ARCH_ubuntu_14.04.deb

	smb://$SERVER_FILE/netlogonlnx$/tokens/softplan/14.04/websigner@softplan.com.br.xpi -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS 	
    mv websigner@softplan.com.br.xpi /usr/lib/firefox-addons/extensions/
	chmod 644 /usr/lib/firefox-addons/extensions/websigner@softplan.com.br.xpi

	printf 'Em perfil já criado deverá remover o .mozilla do diretório do usuário\n para que a nova extensão funcione.'

	echo "[-...Instalação concluída...]"
}






# Instalacao maquina virtual WINXP para TOKEN PMTWXP-TOKEN
vmtoken(){
 printf '[+...Installing maquina virtual WINXP para TOKEN PMTWXP-TOKEN...]\nTokens: Giesecke & Devrient GmbH,Certisign, GD Starsign (GB Burti)\nImprensa Oficial (pubnet)'

 virtualbox

# smbget smb://$SERVER_FILE/netlogonlnx$/PMTWXP-TOKEN.vdi -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS 
# mv PMTWXP-TOKEN.vdi /opt/ -f
# chmod 777 /opt/PMTWXP-TOKEN.vdi
# apt-get install virtualbox-4.3 -y --force-yes


 # Caso o Windows XP não reconheça o dispositivo
 # Em windows XP, clicar em dispositivos Leitores de Cartao (Ativar/destivar) o dispositivo

 # Adicionar o usuario ao grupo vboxusers, vboxsf

 response=

 echo -n "Entre com o nome do usuário para adicionar ao grupo vboxusers: " 
 read response
 usermod -a -G vboxusers $response
 usermod -a -G vboxsf $response

 echo "[-...Obtendo VDI do token...]"
 smbget smb://$SERVER_FILE/netlogonlnx$/PMTWXP-TOKEN.vdi -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS 
 mkdir -p /opt/token
 echo "[-...Movendo VDI do token para /opt/token...]"
 mv PMTWXP-TOKEN.vdi /opt/token/ -vR
 chmod 777 /opt/token -vR
 echo "[-...Operação concluída...]"
 printf '\n\n'
 printf 'Configure a .VDI no perfil do usuário através do Virtualbox...\n\n'
 printf 'Nome da máquina: pmttoken-000000\n'
 printf 'placa de rede em modo bridge\n'
 printf 'verificar o mac address gerado pelo Virtualbox\n'
 printf 'desativar o audio\n'
 printf 'Ativar a opção "Habilitar o I/O APIC" em configurações da Placa-Mãe no Virtualbox\n'



}



# [...Opção padrão para instalação,após a execução deste método a máquina ja estará pronta para uso...]
all(){
 clear
 printf 'Instalação padrão...\n'
 printf 'Executar as seguintes opções sequencialmente:\n' 
 printf	'[+]\n' 
 printf   '\t|-> sources\n'
 printf   '\t|-> install\n'
# printf	  '\t|-> ssh\n'
# printf	  '\t|-> firefox\n'
 printf	  '\t|-> chrome\n'
 printf	  '\t|-> printer\n'
 printf	  '\t|-> domainconfig\n'
 printf	  '\t|-> lightdmconfig\n'
 printf	  '\t|-> fonts\n'
 printf	  '\t|-> configscript\n'
 printf	  '\t|-> vncconfig\n'
 printf	  '\t|-> dwg\n'
# printf	  '\t|-> spark\n'
 printf	  '\t|-> usbdisable\n'
# printf   '\t|-> wpsoffice\n'
# printf   '\t|-> cups\n'

}



# [...Instala fonts TTFs para Linux...]
fonts(){

 printf '[+...Installing fonts TTF para Linux...'

 if [ ! -d /usr/share/fonts/windows ]
 then
	mkdir -p /usr/share/fonts/windows
 fi

 smbget smb://$SERVER_FILE/netlogonlnx$/fonts.tar.gz -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 tar -xvf fonts.tar.gz -C /usr/share/fonts/windows
 #tar -xvf fonts.tar.gz -C /wine/drive_c/windows/Fonts/
 rm -rf fonts.tar.gz 
}



# [...Configura o script local para aplicação das regras de login no cliente...]
configscript(){
 smbget smb://$SERVER_FILE/netlogonlnx$/local_lab.sh.x -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 mv local_lab.sh.x /etc/local_lab.sh.x -f
 chmod a+x /etc/local_lab.sh.x

 guestsession

}



# [...Configura máquina equipe suporte TI...]"
suporte(){

 sources

 apt-get install openssh-server aptitude -y --force-yes
 apt-get install libpam-krb5 krb5-user smbclient -y --force-yes
 apt-get install ubuntu-restricted-extras -y --force-yes

 apt-get install libdvdread4 -y --force-yes
 sh /usr/share/doc/libdvdread4/install-css.sh

 apt-get install pepperflashplugin-nonfree -y --force-yes

 apt-get install unace p7zip-rar sharutils rar arj lunzip lzip -y --force-yes

 apt-get install nfs-client -y --force-yes

 apt-get install linuxlogo -y --force-yes
 echo "-L ubuntu" >/etc/linux_logo.conf 
 echo "" >>/etc/profile && echo "linux_logo" >>/etc/profile

 echo "[+...Multimedia install...]"
 apt-get install vlc -y --force-yes

 "[+...Installing MasterPDFEditor...]"
 smbget smb://$SERVER_FILE/netlogonlnx$/apps/MasterPDFEditor.$ARCH.tar.gz -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 tar zxvf MasterPDFEditor.$ARCH.tar.gz
 mv MasterPDFEditor /opt -f
 chmod 777 -R /opt/MasterPDFEditor
 smbget smb://$SERVER_FILE/netlogonlnx$/apps/master-pdf-editor.desktop -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 mv master-pdf-editor.desktop /usr/share/applications -f

 fonts
# wine

}



# [...Personalização para atalhos Wine...]
#wineshortcuts(){

# echo "[+]...Alterando permissões wine..."
# chmod 777 /wine -R

# chown $LDAPACCOUNTNAME:$LDAPACCOUNTNAME /wine -R

 # verifica se ja existe link simbolico .DRIVE_C, caso nao cria, opcao -L
# echo "[+]...Verificando link .DRIVE_C wine em home do usuário..." 
# if [ ! -L /home/$LDAPACCOUNTNAME/.DRIVE_C ]
# then
#         ln -s /wine/drive_c/ .DRIVE_C
# fi

 # verifica se ja existe link simbolico DRIVE_C, caso nao cria, opcao -L
 #echo "[+]...Verificando link DRIVE_C wine em home do usuário..." 
 #if [ ! -L /home/$LDAPACCOUNTNAME/DRIVE_C ]
 #then
 #        ln -s /wine/drive_c/ DRIVE_C
 #fi


 # verifica se já existe link simbólico .wine, caso não existir cria:
 # opcao -L para criar
# echo "[+]...Criando link simbólico para wine..."
# if [ ! -L /home/$LDAPACCOUNTNAME/.wine ]
# then
#        ln -s /wine /home/$LDAPACCOUNTNAME/.wine
# fi


# echo "[+]...Todas as configurações foram realizadas..." 

#}



networkdhcp(){
 echo "[+]...Configurando interface de rede..."
 echo "" >>/etc/network/interfaces
 echo "" >>/etc/network/interfaces
 echo "auto $INTERFACE" >>/etc/network/interfaces
 echo "allow-hotplug $INTERFACE" >>/etc/network/interfaces
 echo "iface $INTERFACE inet dhcp" >>/etc/network/interfaces
}



nvidia(){
 echo "[+]...Installing drivers padrão nvidia..."
 # http://www.geforce.com/drivers/results/49072
 # Ubuntu 14.04 / 13.10 / 13.04 / 12.10
 # apt-add-repository ppa:xorg-edgers/ppa

 # Ubuntu 12.04 / 11.10 / 11.04 / 10.04
 # apt-add-repository ppa:ubuntu-x-swat/x-updates

 # apt-get update
 apt-get install nvidia-current
 service lightdm restart

}



virtualbox(){

 echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >/etc/apt/sources.list.d/virtualbox.list
 apt-get update
 apt-get install virtualbox-4.3 virtualbox-guest-dkms virtualbox-guest-x11 -y --force-yes

}



video(){

 echo "[+]...Corrigindo congelamento de vídeo em máquinas antigas..."

 echo "blacklist nouveau" >>/etc/modprobe.d/blacklist.conf
 echo "options nouveau modeset=0" >>/etc/modprobe.d/blacklist.conf

 apt-get --purge remove xserver-xorg-video-nouveau	
 update-initramfs -u

 nvidia

 printf '\n\n<------REINICIE A MÁQUINA------>\n\n'

}



dwg(){
	
 smbget smb://$SERVER_FILE/netlogonlnx$/apps/TeighaViewer_QT5_$ARCH.deb -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 smbget smb://$SERVER_FILE/netlogonlnx$/apps/varicad-view.deb -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 dpkg -i TeighaViewer_QT5_$ARCH.deb
 rm -rf TeighaViewer_QT5_$ARCH.deb

 dpkg -i varicad-view.deb
 rm -rf varicad-view.deb

}



usbdisable(){
 >/etc/udev/rules.d/85-noautomount.rules
 echo 'SUBSYSTEM=="usb", ENV{UDISKS_AUTO}="0"' >/etc/udev/rules.d/85-no-automount.rules
 gsettings set org.gnome.desktop.media-handling automount-open false
 gsettings set org.gnome.desktop.media-handling automount false

 chmod a-x /usr/lib/gvfs/gvfsd-mtp
 chmod a-x /usr/lib/gvfs/gvfsd-gphoto2
 chmod a-x /usr/lib/gvfs/gvfs-gphoto2-volume-monitor
 chmod a-x /usr/lib/gvfs/gvfs-mtp-volume-monitor

 echo "blacklist usb_storage" >> /etc/modprobe.d/blacklist.conf
 echo "blacklist uas" >> /etc/modprobe.d/blacklist.conf
 #Atualizando initramfs (rebuild), copia de blacklist esta armazenado em initramfs, por isso a necessidade de rebuild

 rmmod usb_storage
 rmmod uas

 mv /lib/modules/$(uname -r)/kernel/drivers/usb/storage/usb-storage.ko /lib/modules/$(uname -r)/kernel/drivers/usb/storage/usb-storage.ko.bkp
 mv /lib/modules/$(uname -r)/kernel/drivers/usb/storage/uas.ko /lib/modules/$(uname -r)/kernel/drivers/usb/storage/uas.ko.bkp

 depmod -a

 update-initramfs -u
 printf '\n\n<------REINICIE A MÁQUINA------>\n\n'
}



usbenable(){

 rm /etc/udev/rules.d/85-noautomount.rules 

 gsettings set org.gnome.desktop.media-handling automount-open true
 gsettings set org.gnome.desktop.media-handling automount true


 chmod a+x /usr/lib/gvfs/gvfsd-mtp
 chmod a+x /usr/lib/gvfs/gvfsd-gphoto2
 chmod a+x /usr/lib/gvfs/gvfs-gphoto2-volume-monitor
 chmod a+x /usr/lib/gvfs/gvfs-mtp-volume-monitor

 mv /etc/modprobe.d/blacklist.conf /etc/modprobe.d/blacklist.conf.old -f
 sed s/'blacklist usb_storage'/''/g /etc/modprobe.d/blacklist.conf.old >/etc/modprobe.d/blacklist.conf
 rm -rf /etc/modprobe.d/blacklist.conf.old

 mv /etc/modprobe.d/blacklist.conf /etc/modprobe.d/blacklist.conf.old -f
 sed s/'blacklist uas'/''/g /etc/modprobe.d/blacklist.conf.old >/etc/modprobe.d/blacklist.conf
 rm -rf /etc/modprobe.d/blacklist.conf.old



 mv /lib/modules/$(uname -r)/kernel/drivers/usb/storage/usb-storage.ko.bkp /lib/modules/$(uname -r)/kernel/drivers/usb/storage/usb-storage.ko
 mv /lib/modules/$(uname -r)/kernel/drivers/usb/storage/uas.ko.bkp /lib/modules/$(uname -r)/kernel/drivers/usb/storage/uas.ko
 modprobe usb-storage
 modprobe uas

 #Atualizando initramfs (rebuild), copia de blacklist esta armazenado em initramfs, por isso a necessidade de rebuild
 update-initramfs -u

 printf '\n\n<------REINICIE A MÁQUINA------>\n\n'
}


usbip(){
	apt-get install libusbip0 libusbip-dev linux-tools-generic linux-tools-`uname -r`
	modprobe usbip_host
	echo 'usbip_host' >> /etc/modules
	/usr/lib/linux-tools/`uname -r`/usbipd
	smbget smb://$SERVER_FILE/netlogonlnx$/usbip/client/UsbIp.jar -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
	mv UsbIp.jar /tmp
	smbget smb://$SERVER_FILE/netlogonlnx$/usbip/client/usbip.disktop -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
	mv usbip.desktop /tmp
	echo "#/bin/sh -e" > /etc/rc.local
	echo "/usr/lib/linux-tools/`uname -r`/usbipd -D" >>/etc/rc.local
	echo "exit 0" >>/etc/rc.local
}


ie(){

 clear
 printf '[+...Installing suporte para Internet Explorer...\n'
 printf 'PLayOnLinux\n\n'
 apt-get install playonlinux -y --force-yes
 smbget smb://$SERVER_FILE/netlogonlnx$/PlayOnLinux.tar.gz -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 
 if [ ! -d /wine ]
 then
	mkdir -p /wine
 fi

 tar -xvf PlayOnLinux.tar.gz -C /wine/
 
 chmod 777 -R /wine/.PlayOnLinux
 
 rm -rf PlayOnLinux.tar.gz

 printf 'Instalação realizada com sucesso...\n\n'

 printf 'Criação do atalho é feita automaticamente pelo script local_lab.sh.x\n\n'

 printf 'Re-executar o comando:\n\n'
 printf ' ./config_1404_lab.sh.x configscript\n'
 printf 'Para atualização dos scripts locais'

}



monitoramento(){

 clear
 printf '[+...Installing suporte para monitoramento de Câmeras...\n'
 printf 'PLayOnLinux\n\n'
 apt-get install playonlinux -y --force-yes
 smbget smb://$SERVER_FILE/netlogonlnx$/PlayOnLinux.tar.gz -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 
 if [ ! -d /wine ]
 then
	mkdir -p /wine && chmod 777 /wine
 fi

 tar -xvf PlayOnLinux.tar.gz -C /wine/
 
 chmod 777 -R /wine/
 
 rm -rf PlayOnLinux.tar.gz

 printf 'Instalação realizada com sucesso...\n\n'

 printf 'Criação do atalho é feita automaticamente pelo script local_lab.sh.x\n\n'

 printf 'Re-executar o comando:\n\n'
 printf ' ./config_1404_lab.sh.x configscript\n'
 printf 'Para atualização dos scripts locais'

}



ativarrdp(){

 clear
 # PMT-MONITOR (192.168.1.10)
 printf '[+...Instalando suporte para acesso remoto (RDP)\n'
 apt-get install rdesktop -y --force-yes

}



spark(){
 printf '[+...Instalando Spark messenger para Openfire...\n'
 smbget smb://$SERVER_FILE/netlogonlnx$/spark.tar.gz -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 tar -xvf spark.tar.gz -C /opt/
 rm -rf spark.tar.gz
 ln -s /opt/Spark/Spark /usr/bin/Spark
}



videointel(){

 printf 'Removendo drivers Intel e substituíndo por drivers vesa padrão\n\n'

 echo "blacklist i915" >>/etc/modprobe.d/blacklist.conf
 apt-get remove xserver-xorg-video-intel
 apt-get install xserver-xorg-video-vesa

 smbget smb://$SERVER_FILE/netlogonlnx$/xorg/intel/xorg.conf -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 printf 'Movendo arquivo xorg.conf para /etc/X11/\n\n'
 mv xorg.conf /etc/X11/ -f

 smbget smb://$SERVER_FILE/netlogonlnx$/xorg/intel/xrandr.sh -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 printf 'Movendo arquivo xrandr.sh para /opt/\n\n'
 mv xrandr.sh /opt/ -f
 chmod a+rx /opt/xrandr.sh

 smbget smb://$SERVER_FILE/netlogonlnx$/xorg/intel/lightdm.conf -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS 
 printf 'Movendo o arquivo lightdm.conf para /etc/lightdm/\n\n'
 mv lightdm.conf /etc/lightdm/ -f

 printf 'Padrão 1280x1024\n\n'

 tip12

 # update init image boot
 update-initramfs -u

 printf '\n\n<------REINICIE A MÁQUINA------>\n\n'

}



videoati(){

 printf 'Removendo drivers vídeo e substituíndo por drivers vesa padrão\n\n'

 apt-get remove xserver-xorg-video-intel
 apt-get install xserver-xorg-video-vesa

 smbget smb://$SERVER_FILE/netlogonlnx$/xorg/ati/xorg.conf -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 printf 'Movendo arquivo xorg.conf para /etc/X11/\n\n'
 mv xorg.conf /etc/X11/ -f

 smbget smb://$SERVER_FILE/netlogonlnx$/xorg/ati/xrandr.sh -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 printf 'Movendo arquivo xrandr.sh para /opt/\n\n'
 mv xrandr.sh /opt/ -f
 chmod a+rx /opt/xrandr.sh

 smbget smb://$SERVER_FILE/netlogonlnx$/xorg/intel/lightdm.conf -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS 
 printf 'Movendo o arquivo lightdm.conf para /etc/lightdm/\n\n'
 mv lightdm.conf /etc/lightdm/ -f

 printf 'Padrão 1024x768\n\n'

 tip2

 # update init image boot
 update-initramfs -u
 
 printf '\n\n<------REINICIE A MÁQUINA------>\n\n'

}



guestsession(){
 
 #<--
 #configscript
 #-->

 print 'Ativando conta convidado.\n'
 print 'Checando diretórios.\n'

 if [ ! -d /var/guest-data ]
 then
	mkdir -m 0777 /var/guest-data
 fi

 if [ ! -d /etc/guest-session ]
 then
	mkdir -p /etc/guest-session/sv/LC_MESSAGES
 fi

 print 'Obtendo arquivos para configuração de conta convidado.\n'

 smbget smb://$SERVER_FILE/netlogonlnx$/guest/auto.sh -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 smbget smb://$SERVER_FILE/netlogonlnx$/guest/prefs.sh -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS  
 smbget smb://$SERVER_FILE/netlogonlnx$/guest/sv/LC_MESSAGES/guest-session-prefs-lightdm.mo -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 smbget smb://$SERVER_FILE/netlogonlnx$/guest_lab.sh.x -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS  

 smbget smb://$SERVER_FILE/netlogonlnx$/guest/menus.tar.gz -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS 

 printf 'Movendo arquivos.\n'

 mv menus.tar.gz /usr/share/lightdm/ -f

 mv guest_lab.sh.x /etc/ -f
 mv auto.sh /etc/guest-session/ -f
 mv prefs.sh /etc/guest-session/ -f
 mv guest-session-prefs-lightdm.mo /etc/guest-session/sv/LC_MESSAGES/ -f

 chmod a+x /etc/guest_lab.sh.x
 chmod a+x /etc/guest-session/auto.sh
 chmod a+x /etc/guest-session/prefs.sh

 printf "Conta convidado configurada com sucesso.\n"

}



language(){
 "[+]...Instalando tradução para LibreOffice...]\n"
 "[+]...Instalando corretor ortográfico pt-br...]\n"
  apt-get install libreoffice-l10n-pt-br myspell-pt-br expect -y --force-yes
}



networkconfig(){

echo "auto lo" >>/etc/network/interfaces
echo "iface lo inet loopback" >>/etc/network/interfaces

line=$(ifconfig | grep eth)

printf "$line\n"

response=

echo -n "Entre com a interface de rede padrão: " 
read response
echo "auto $response" >>/etc/network/interfaces
echo "allow-hotplug $response" >>/etc/network/interfaces
echo "iface $response inet static" >>/etc/network/interfaces

echo ""
echo -n "Entre com o endereço ip: "
read response
echo "  address $response" >>/etc/network/interfaces

echo ""
echo -n "Entre com a máscara de rede: "
read response
echo "  netmask $response" >>/etc/network/interfaces

echo ""
echo -n "Entre com o gateway padão: "
read response
echo "  gateway $response" >>/etc/network/interfaces

echo ""
echo -n "Entre com o nome do domínio de pesquisa (ex.: domain.com): "
read response
echo "  dns-search $response" >>/etc/network/interfaces

echo ""
echo -n "Entre com o endereço do servidor dns: "
read response
echo "	dns-nameservers $response" >>/etc/network/interfaces

echo ""
echo "Configuração de rede finalizada [...]"
echo "Dados da interface:"
echo ""

cat /etc/network/interfaces

echo ""
echo "Caso exista interfaces em execesso limpar o arquivo: /etc/udev/rules.d/70-persistent-net.rules"
echo "Reiniciar a máquina e rodar novamente o script com o parâmetro [networkconfig]"
echo ""

}


hplip(){

 clear
 printf '\n'
 printf "The HPLIP Automatic Installer\n"
 printf "The Automatic Installer is known to work on the following Linux Distributions:\n"
 printf "\n"
 printf "SUSE Linux (12.2, 12.3, 13.1, 13.2)\n"
 printf "Fedora (17, 18, 19, 20, 21, 22)\n"
 printf "Linux Mint (13, 14, 15, 16, 17, 17.1)\n"
 printf "Red Hat Enterprise Linux (6.0, 7.0)\n"
 printf "Boss (3.0, 5.0)\n"
 printf "Ubuntu (10.04, 11.10, 12.04, 12.10, 13.04, 13.10, 14.04, 14.10, 15.04)\n"
 printf "Debian (6.0, 6.0.1, 6.0.10, 6.0.2, 6.0.3, 6.0.4, 6.0.5, 6.0.6, 6.0.7, 6.0.8, 6.0.9, 7.0, 7.1, 7.2, 7.3, 7.4, 7.5, 7.6, 7.7, 7.8, 8.0)\n"

 printf "A execução do script deverá ocorrer em uma sessão gráfica, pois será aberto o wizard da instalação.\n"

 smbget smb://$SERVER_FILE/netlogonlnx$/drivers/hp/hplip.run -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS

 ./hplip.run

}



libreoffice(){

 clear
 printf "[+]...Instalando Libreoffice, Libreoffice base, Tradução e corretor ortográfico...\n\n"
 sudo apt-get install libreoffice libreoffice-base libreoffice-l10n-pt-br myspell-pt-br expect -y --force-yes

}



traduzirsistema(){

printf 'Tradução do sistema para pt_BR\n'
printf 'pt_PT.UTF-8 UTF-8 --> /var/lib/locales/supported.d/pt\n'
printf 'pt_PT.UTF-8 UTF-8 --> /var/lib/locales/supported.d/pt\n'
printf '\n\n'
printf 'export LANG=pt_BR.UTF-8 --> /etc/profile\n'
printf 'export LANGUAGE=pt_BR:pt:en --> /etc/profile\n'

echo "pt_PT.UTF-8 UTF-8" >/var/lib/locales/supported.d/pt
echo "pt_BR.UTF-8 UTF-8" >>/var/lib/locales/supported.d/pt 

echo "en_HK.UTF-8 UTF-8" >/var/lib/locales/supported.d/en
echo "en_DK.UTF-8 UTF-8" >>/var/lib/locales/supported.d/en
echo "en_IN UTF-8" >>/var/lib/locales/supported.d/en
echo "en_ZM UTF-8" >>/var/lib/locales/supported.d/en
echo "en_ZW.UTF-8 UTF-8" >>/var/lib/locales/supported.d/en
echo "en_NZ.UTF-8 UTF-8" >>/var/lib/locales/supported.d/en
echo "en_PH.UTF-8 UTF-8" >>/var/lib/locales/supported.d/en
echo "en_NG UTF-8" >>/var/lib/locales/supported.d/en
echo "en_US.UTF-8 UTF-8" >>/var/lib/locales/supported.d/en
echo "en_GB.UTF-8 UTF-8" >>/var/lib/locales/supported.d/en
echo "en_AU.UTF-8 UTF-8" >>/var/lib/locales/supported.d/en
echo "en_SG.UTF-8 UTF-8" >>/var/lib/locales/supported.d/en
echo "en_BW.UTF-8 UTF-8" >>/var/lib/locales/supported.d/en
echo "en_AG UTF-8" >>/var/lib/locales/supported.d/en
echo "en_ZA.UTF-8 UTF-8" >>/var/lib/locales/supported.d/en
echo "en_CA.UTF-8 UTF-8" >>/var/lib/locales/supported.d/en
echo "en_IE.UTF-8 UTF-8" >>/var/lib/locales/supported.d/en

echo "export LANG=pt_BR.UTF-8" >>/etc/profile
echo "export LANGUAGE=pt_BR:pt:en" >>/etc/profile

printf 'LANG="pt_BR.UTF-8"' >/etc/default/locale
printf 'LANGUAGE="pt_BR:pt:en"' >>/etc/default/locale

dpkg-reconfigure locales
locale-gen --no-purge --lang pt_BR
update-locale LANG=pt_BR.UTF-8


}



wpsoffice(){

 clear
 printf '[+] Obtendo WPS Office...\n'
 smbget smb://$SERVER_FILE/netlogonlnx$/wps/wps-office-fonts.deb -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 smbget smb://$SERVER_FILE/netlogonlnx$/wps/wps-office-mui-pt-br.deb -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 smbget smb://$SERVER_FILE/netlogonlnx$/wps/wps-office-vero.deb -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 smbget smb://$SERVER_FILE/netlogonlnx$/wps/wps-office-winfonts.deb -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 smbget smb://$SERVER_FILE/netlogonlnx$/wps/wps-office_$ARCH.deb -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 printf '[+] Instalando WPS Office...\n'
 dpkg -i wps-office_$ARCH.deb
 dpkg -i *.deb

 printf '[+]  Instalando dicionário pt_BR...\n'
 smbget smb://$SERVER_FILE/netlogonlnx$/wps/pt_BR.zip -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 unzip pt_BR.zip
 mv pt_BR /opt/kingsoft/wps-office/office6/dicts/
 chmod 777 /opt/kingsoft/wps-office/office6/dicts -R
 rm pt_BR.zip

 printf '[+] Removendo arquivos de instalação...\n'
 printf '[+] WPS Office instalado com sucesso...\n'
 rm -rf *.deb

}



cups(){

 printf 'Ativar gerenciamento web para cups (servidor impressão)\n\n'

 response=

 echo -n "Entre com o endereço ip local: " 

 read response

 # mv /etc/cups/cupsd.conf /etc/cups/cupsd.conf.old -f && sed s/'Listen localhost:631'/'Listen '$response':631'/g /etc/cups/cupsd.conf.old >/etc/cups/cupsd.conf && rm -rf /etc/cups/cupsd.conf.old
 mv /etc/cups/cupsd.conf /etc/cups/cupsd.conf.old -f && sed -e "/Listen localhost:631/a Listen $response:631" /etc/cups/cupsd.conf.old >/etc/cups/cupsd.conf && rm -rf /etc/cups/cupsd.conf.old

 mv /etc/cups/cupsd.conf /etc/cups/cupsd.conf.old -f && sed -e "/Order allow,deny/a Allow all" /etc/cups/cupsd.conf.old >/etc/cups/cupsd.conf && rm -rf /etc/cups/cupsd.conf.old

 mv /etc/cups/cups-browsed.conf /etc/cups/cups-browsed.conf.old -f && sed -e "/# BrowseProtocols none/c BrowseProtocols none" /etc/cups/cups-browsed.conf.old >/etc/cups/cups-browsed.conf && rm -rf /etc/cups/cups-browsed.conf.old
 
 smbget smb://$SERVER_FILE/netlogonlnx$/printers/$NETWORK/printers.conf -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS

 /etc/init.d/cups stop 

 mv printers.conf /etc/cups/ -f

 /etc/init.d/cups restart

 /etc/init.d/cups-browsed restart

}



bancobrasil(){
#Extrair o arquivo:
#tar -zxvf bbtokentool-1.1.1-4/

#Entrar no diretório:
#cd bbtokentool-1.1.1-4/

#Aplicar o patch:
#patch -p1 < [ARQUIVO_DE_PATCH]

 echo "Instalando pacotes necessários (dkms gcc binutils make)..."
 apt-get install dkms gcc binutils make -y --force-yes

 echo "Obtendo instalação BBtoken..."
 smbget smb://$SERVER_FILE/netlogonlnx$/bancos/bb/bbtokentool.tar.gz -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 smbget smb://$SERVER_FILE/netlogonlnx$/bancos/bb/patch -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS

 tar xvf bbtokentool.tar.gz
 cp patch bbtokentool
 cd bbtokentool

 echo "Aplicando patch correção BBtoken..."
 patch -p1 < patch

 echo "Instalando BBtoken..."
 ./install

}



rtl8111(){

 apt-get install make gcc build-essential -y --force-yes

 echo "Obtendo driver Realtek RTL8111/8168/8411..."
 smbget smb://$SERVER_FILE/netlogonlnx$/drivers/rtl8111/rtl8111.tar.gz -w $LDAPDMN -u $LDAPUSER -p $LDAPPASS
 tar -xvf rtl8111.tar.gz
 cd rtl8111
 make clean modules
 make install

 depmod -a

 #echo "options eee_enable=1" >/etc/modprobe.d/r8168.conf
 #echo "options timer_account=3600" >>/etc/modprobe.d/r8168.conf

 echo "Adicinando módulo r8168 para carregamento automático em /etc/modules..."
 echo "r8168" >>/etc/modules

 echo "Adicinando módulo r8169 para bloqueio de carregamento em /etc/modprobe.d/blacklist.list..."
 echo "blacklist r8169" >>/etc/modprobe.d/blacklist.conf

 echo "Regerando imagem do kernel /boot/initrd.img-`uname -r`"
 mv /boot/initrd.img-`uname -r` /boot/initrd.img-`uname -r`.bkp
 mkinitramfs -o /boot/initrd.img-`uname -r` `uname -r`

 echo "Regerando imagem para initramfs..."
 update-initramfs -u

 response=

 echo -n "Entre com o nome da interface: " 
 read response

 printf '\n\n'
 ethtool -i $response
 printf '\n\n'
 ethtool $response

}


ntp(){
 echo "Removendo servidor NTP..."
 apt-get remove ntp -y --force-yes
 ntpdate $NTP_SERVER
}


version (){
 echo "Version:"	
 echo "$V_VERSION"
 echo "Build:"
 echo "$V_BUILD"
}


install_gscan2pdf(){
	echo "[+] Instalando gscan2pdf [OCR]...PDF Pesquisável..."
 	apt-get install gscan2pdf tesseract-ocr-por -y --force-yes
}


case "$1" in
 	'default')
		echo "Instalação padrão"
		all
		;;
 	'install')
		echo "Instalando aplicações necessárias..."
		install
		#wine
		;;
	'java')
		echo "Instalação do Oracle Java..."
		java
		;;
	'chrome')
		echo "Instalação google chrome..."
		chrome
		;;	
	'firefox')
		echo "Instalação firefox..."
		firefox
		;;	
	'domainconfig')
		echo "Configuração para ingressar no Domínio..."
		domainconfig
		;;	
	'sources')
		echo "Atualiza sources.list com endereços dos repositórios necessários ($CODENAME)..."
		sources
		;;		
	'lightdmconfig')
		echo "Atualiza configurações do lightdm..."
		lightdmconfig
		guestsession
		;;	
	'domainclearcache')
		echo "Limpa o cache de UIDs/GIDs do samba..."
		domainclearcache
		;;	
	'ssh')		
		echo "Instalando acesso remoto SSH..."
		ssh
		;;
	'printer')		
		echo "Instalando drivers para printer Lexmark..."
		printer
		;;	
	'configscript')
		echo 'Instala login script no cliente'
		configscript
		;;
	'vncconfig')
 		echo "Instala arquivos de configuração vnc no cliente"	
		vncconfig
		;;
 	'certificadodigital')		
		echo "[+...Instalar certificado digital para Token USB...]"	
		certificadodigital
		;;
	'vmtoken')
		echo "[+...Instalar maquina virtual WINXP para TOKEN PMTWXP-TOKEN...]"
		vmtoken
		;;
	'fonts')
 		echo "[+...Instalando fonts TTF para Linux e Wine..."
		fonts
		;;
	'suporte')
		echo "[+...Configura máquina equipe suporte TI...]"
		suporte			
		;;	
	'confignetwork')
		echo "[+...Configura interface de rede para mode dhcp...]"
		confignetwork
		;;
	'nvidia')
		echo "[+...Instala drivers padrão nvidia...]"
		nvidia
		;;
	'virtualbox')
		echo "[+...Instala drivers guest para virtualbox...]"
		virtualbox
		;;
	'video')
		echo "[+...Corrige congelamento de vídeo em máquinas antigas...]"
		video
		;;
	'dwg')
		echo "[+...Instala visualizador DWG Teigha...]"
		dwg
		;;
	'usbdisable')
		echo "[+...Desativando usb automount...]"
		usbdisable
		;;
	'usbenable')
		echo "[+...Reativando usb automount...]"
		usbenable
		;;
	'monitoramento')
		monitoramento
		;;
	'lightdmbackground')
		lightdmbackground
		;;
	'spark')
		spark
		;;
	'videointel')
		videointel
		;;
	'guestsession')
		guestsession
		;;
	'language')
		language
		;;
	'videoati')
		videoati
		;;
	'networkconfig')
		networkconfig
		;;
	'hplip')
		hplip
		;;
	'libreoffice')
		libreoffice
		;;
	'ativarrdp')
		ativarrdp
		;;
	'traduzirsistema')
		traduzirsistema
		;;
	'wpsoffice')
		wpsoffice
		;;
	'cups')
		cups
		;;
	'bancobrasil')
		bancobrasil
		;;
	'rtl8111')
		rtl8111
		;;
	'ntp')
		ntp
		;;
	'usbip')
		usbip
		;;
	'ie')
		ie
		;;
	'gscan2pdf')
		install_gscan2pdf
		;;
	'websigner')
		websigner
		;;
	'epson')
		epson
		;;
	'info')
		info
		;;
	'version')
		version
		;;
	'1')
		tip_locks
		;;
	'2')
		tip_gpumanager
		;;
	'3')
		tip_recovery
		;;
	'4')
		tip_domainconfig
		;;
	'5')
		tip_strace
		;;
	'6')
		tip_padronizacao
		;;
	'7')
		tip_networkconfiguration
		;;
	'8')
		tip_ubuntuversion
		;;
	'9')
		tip_livecommand
		;;
	'10')
		tip_vnc
		;;
	'11')
		tip_printer
		;;
	'12')
		tip_video
		;;
	'13')
		tip_usbip
		;;
	*)
		clear
		printf './config_1404_lab.sh.x [option]\n\n'
		printf 'option:\n\n'
		printf '\tdefault: \t\t Instalação padrão\n'
	        printf '\tinstall:\t\t Instala aplicações necessárias\n\t'
		printf 'domainconfig:\t\t Configura Dominio: tickets,join,script login/logout GDM\n\t'
		printf 'java:\t\t\t Instalalação do Oracle Java\n\t'
		printf 'chrome:\t\t\t Instala Google chrome\n\t'
		printf 'firefox:\t\t Instala Mozilla Firefox\n\t'
		printf 'sources:\t\t Atualiza sources.list com endereços dos repositórios necessários ($CODENAME)\n\t'
		printf 'lightdmconfig:\t\t Atualiza configurações do lightdm\n\t'
		printf 'domainclearcache:\t Limpa o cache de UIDs/GIDs do samba\n\t'
		printf 'ssh:\t\t\t Instala acesso remoto SSH\n\t'
		printf 'printer:\t\t Instala drivers para printer Lexmark\n\t'
		printf 'configscript:\t\t Instala login script no cliente\n\t'
		printf 'vncconfig:\t\t Instala arquivos de configuração vnc no cliente\n\t'
		printf 'certificadodigital:\t Instalar certificado digital para Token USB\n\t'
		printf 'vmtoken:\t\t Instalar maquina virtual WINXP para TOKEN PMTWXP-TOKEN\n\t'
 		printf 'fonts:\t\t\t Instala fonts TTF para Linux e Wine\n\t'
 		printf 'suporte:\t\t Configura máquina equipe suporte TI\n\t'
 		printf 'networkdhcp:\t\t Configura interface de rede para mode dhcp\n\t'
 		printf 'nvidia:\t\t\t Instalando drivers padrão nvidia\n\t'
 		printf 'virtualbox:\t\t Instalando drivers guest para virtualbox\n\t'
 		printf 'video:\t\t\t Corrige congelamento de vídeo em máquinas antigas\n\t'
 		printf 'dwg:\t\t\t Instala visualizador DGW Teigha\n\t'
 		printf 'usbdisable:\t\t Desativa usb automount\n\t'
 		printf 'usbenable:\t\t Reativa usb automount\n\t'
 		printf 'monitoramento:\t\t Instala suporte para monitoramento de Câmeras\n\t'
 		printf 'lightdmbackground:\t Altera plano de fundo ta tela de login\n'
 		printf '\tspark:\t\t\t Instalar Spark Messenger para Openfire\n'
 		printf '\tvideointel:\t\t Remover vídeo Intel i915 e similares e configurar vídeo padrão VESA\n'
 		printf '\tguestsession:\t\t Ativar conta convidado\n'
 		printf '\tlanguage:\t\t Instala pacote de idiomas\n'
 		printf '\tvideoati:\t\t Remover vídeo e similares e configurar vídeo padrão VESA para ATI\n'
		printf '\tnetworkconfig\t\t Configurar interface de rede\n'
		printf '\thplip\t\t\t HPLIP Automatic Installer (Hewlett-Packard) [Sessão Gráfica]\n'
		printf '\tlibreoffice\t\t Instala Libreoffice, Libreoffice base, Tradução e corretor ortográfico\n'
		printf '\tativarrdp\t\t Instala suporte para acesso remoto (RDP)\n'
		printf '\ttraduzirsistema\t\t Traduzir sistema linux (Ubuntu) para pt_BR\n'
		printf '\twpsoffice\t\t Instalar WPS Office\n'
		printf '\tcups\t\t\t Ativar cups remoto\n'
		printf '\tbancobrasil\t\t Configura token para Banco do Brasil\n'
		printf '\trtl8111\t\t\t Corrige falha em módulos RTL8111/8168/8411\n'
		printf '\tusbip \t\t\t USB-Over-IP - Mapeamentos de USBs storage remoto\n'
		printf '\tie\t\t\t Configurar Internet Explorer para PlayOnLinux\n'
		printf '\tntp\t\t\t Remover servidor ntp\n'
		printf '\tgscan2pdf:\t\t gscan2pdf OCR, gerar PDF pesquisável\n'
		printf '\twebsigner:\t\t Softplan websigner Firefox\n'
		printf '\tepson:\t\t Epson printer driver\n'
		printf '\tinfo:\t\t\t Informações extras\n'		
		printf '\tversion:\t\t Versão do script\n'
		printf '\nDICAS:\n\n'
		printf '\t[1]  A maioria dos travamentos de tela ocorre devido a instabilidades em pacotes padrões de vídeo\n\t'
		printf '[2]  Controla e sobreescreve o xorg.conf\n\t'
		printf '[3]  Boot recovery mode\n\t'
		printf '[4]  Domainconfig dados preenchimento. REALM KERBEROS\n\t'
		printf '[5]  Traçar arquivos executados por determinado programa em tempo de execução\n\t'
		printf '[6]  Dados para padronização das máquinas\n\t'
		printf '[7]  Ethernet configuration\n\t'
		printf '[8]  Ubuntu distro codenames\n\t'
		printf '[9]  Executar um comando periodicamente mostrando resultados em tempo real\n\t'
		printf '[10] Porta padrão para acesso vnc\n\t'
		printf '[11] Configurar arquivo LEXSCAN para função scan. E comandos úteis para impressão.\n\t'
		printf '[12] Dicas sobre video,Drivers Intel i915 e similares\n\t'
		printf '[13] Dicas sobre usbip\n\t'
		printf '\n'
		;;
esac
