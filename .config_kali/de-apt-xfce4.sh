#!/bin/bash

#Get the necessary components
apt update && apt upgrade -y
apt-mark hold udisks2
apt install sudo -y
sudo enter-chroot
sudo apt install dbus-x11
apt-get install keyboard-configuration -y
apt-get install sudo wget -y
apt-get install xfce4 xfce4-terminal tigervnc-standalone-server -y
apt-get install xfe -y
apt-get clean

#Setup the necessary files

echo "########################@###############################################"
echo " "
echo "Xfce Instalado"
echo "Configuracion modificada por comander747"
echo "Ahora puede iniciar vncserver ejecutando vncserver-start"
echo " "
echo "Te pedirá que ingreses una contraseña cuando lo inicies por primera vez".
echo "El servidor VNC se iniciará en 127.0.0.1:5901"
echo "Puedes conectarte a esta dirección con el Visor VNC que prefieras"
echo "Conectarse a esta dirección abrirá una ventana con el entorno de escritorio Xfce4"
echo " "
echo "Ejecutando vncserver-start"
echo " "
echo " "
echo "Para eliminar el servidor VNC simplemente ejecute vncserver-stop"
echo " "
echo " "
echo "#########################################################################"
echo "You can now start vncserver by running vncserver-start"
echo " "
echo "It will ask you to enter a password when first time starting it."
echo " "
echo "The VNC Server will be started at 127.0.0.1:5901"
echo " "
echo "You can connect to this address with a VNC Viewer you prefer"
echo " "
echo "Connect to this address will open a window with Xfce4 Desktop Environment"
echo " "
echo " "
echo " "
echo "Running vncserver-start"
echo " "
echo " "
echo " "
echo "To Kill VNC Server just run vncserver-stop"
echo " "
echo " "
echo " "
echo "#########################################################################"

echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile

vncserver-start

cd config_vnc
cp -r .vnc ~/
cp -r bin /usr/local/
#wget "https://github.com/capitancomando/Servidor_Nahfer/blob/main/nahfer-kali" -P /usr/local/bin/
chmod +x ~/.vnc/xstartup
chmod +x /usr/local/bin/vncserver-start
chmod +x /usr/local/bin/vncserver-stop

startxfce &
