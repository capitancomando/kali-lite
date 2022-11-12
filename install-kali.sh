#verificar_arch=$(uname -m);
#!/data/data/com.termux/files/usr/bin/bash
clear
directorio=$(pwd);
mkdir kali_linux
echo $directorio
# banner creado por mi
# github: https://github.com/capitancomando/
# creador del script: comander747
clear

cat $directorio/.banner/.kali_banner.ans
echo -e "\e[1;31m         github: https://github.com/capitancomando\e[0m"
echo -e "\e[1;31m                 https://github.com/Z3R07-RED \n\e[0m"
echo -e "\e[1;31m         Configuracion By: Comander747\e[0m" "\e[1;32m  Kali-linux lite\e[0m"
echo
echo -e "\e[1;36m      kali linux peso: 71 megas.
                       descomprimido: 450 megas.
                       con escritorio xfce: 1 giga.
                       con las herramientas: unknow.\e[0m"
echo
#####@#@@#
cd kali_linux
folder=kali-fs
if [ -d "$folder" ]; then
 first=1
        echo "omitiendo la descarga"
fi

tarball="kali-rootfs.tar.xz"
if [ "$first" != 1 ];then
        if [ ! -f $tarball ]; then
                echo -e "\e[1;32mDescargando Rootfs, esto puede tomar un tiempo según su velocidad de Internet.\e[0m"
                case `dpkg --print-architecture` in
                aarch64)
                        archurl="arm64" ;;
                arm)
                        archurl="armhf" ;;
                amd64)
                        archurl="amd64" ;;
                x86_64)
                        archurl="amd64" ;;
                i*86)
                        archurl="i386" ;;
                x86)
                        archurl="i386" ;;
                *)
                        echo "desconocida architecture"; exit 1 ;;
                esac
                echo
                echo -e "\e[1;31m Tu Procesador es: \e[0m" "\e[1;32m $archurl \e[0m"
                echo
                sleep 2
                wget --no-check-certificate --continue "https://kalilinuxnahferdownloads.000webhostapp.com/kali-rootfs-${archurl}.tar.xz" -O $tarball
                wget --no-check-certificate --continue "https://kalilinuxserver.000webhostapp.com/kali_linux/kali-rootfs-${archurl}.tar.xz" -O $tarball
fi
cur=`pwd`
	mkdir -p "$folder"
	cd "$folder"
	echo -e "\e[1;31mDescomprimiendo, porfavor espere....\e[0m"
	proot --link2symlink tar -xJf ${cur}/${tarball}||:
	cd "$cur"
#####
cp $directorio/.config_kali/kali-setup.sh $directorio/kali_linux/kali-fs/root/
cp -r $directorio/.config_kali $directorio/kali_linux/kali-fs/root
cp -r $directorio/.config_kali/config_vnc/.vnc $directorio/kali_linux/kali-fs/root
cp -r $directorio/.config_kali/config_vnc/bin $directorio/kali_linux/kali-fs/usr/local/
###
fi

mkdir -p kali-binds
bin=start-kali.sh
echo
echo -e "\e[1;33m creando script de lanzamiento \e[0m"
cat > $bin <<- EOM
#!/bin/bash
cd \$(dirname \$0)
if [ `id -u` = 0 ];then
    pulseaudio --start --system
else
    pulseaudio --start
fi
## unset LD_PRELOAD in case termux-exec is installed
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r $folder"
if [ -n "\$(ls -A kali-binds)" ]; then
    for f in kali-binds/* ;do
      . \$f
    done
fi
command+=" -b /dev"
command+=" -b /proc"
command+=" -b kali-fs/root:/dev/shm"
## uncomment the following line to have access to the home directory of termux
#command+=" -b /data/data/com.termux/files/home:/root"
## uncomment the following line to mount /sdcard directly to / 
#command+=" -b /sdcard"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=\$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="\$@"
if [ -z "\$1" ];then
    exec \$command
else
    \$command -c "\$com"
fi
EOM
echo
echo -e "\e[1;34mConfigurando pulseaudio para que puedas tener música en la distribución. \e[0m"
echo
sleep 1
echo -e "\e[1;35marreglando shebang de $ bin \e[0m"
pkg install pulseaudio -y

if grep -q "anonymous" ~/../usr/etc/pulse/default.pa;then
    echo "module already present"
else
    echo "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" >> ~/../usr/etc/pulse/default.pa
fi

echo "exit-idle-time = -1" >> ~/../usr/etc/pulse/daemon.conf
echo "Modified pulseaudio timeout to infinite"
echo "autospawn = no" >> ~/../usr/etc/pulse/client.conf
echo "Disabled pulseaudio autospawn"
echo "export PULSE_SERVER=127.0.0.1" >> kali-fs/etc/profile
echo "Setting Pulseaudio server to 127.0.0.1"
echo
clear
echo -e "\e[1;31marreglando shebang de $ bin \e[0m"
sleep 2
echo
termux-fix-shebang $bin
echo
echo -e "\e[1;33m ejecutable $bin creado \e[0m"
sleep 1
echo
chmod +x $bin
echo -e "\e[1;34mEliminando imagen, para liverar espacio. \e[0m"
sleep 1
rm $tarball
echo
echo -e "\e[1;35mMoviendo Kali_linux a $HOME \e[0m"
echo
sleep 1
mv $directorio/kali_linux ~/
mkdir $directorio/kali_linux
echo -e "\e[1;36m ve a ~/kali_linux y ejecuta  ./${bin}\e[0m"
sleep 1
echo
echo -e "\e[1;31m COMANDOS: \e[0m"  "\e[1;32mcd ~/kali_linux && ./${bin}\e[0m"
echo
sleep 1
echo -e "\e[1;31mUna vez dentro de kali, ejecuta: \e[0m"  "\e[1;32mbash kali-setup.sh\e[0m"
