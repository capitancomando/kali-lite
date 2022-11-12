function menu(){
clear
cat .kali_banner.ans
setterm -foreground green
while true; do
    read -p "
 ~~> Creador: Comander747.
 ~~> Kali linux lite Termux
 ~~> Comunity hacking programations.
 ~~> github : https://github.com/capitancomando

    [~]~~>[MENU]
    [~]
    [1] Instalar Key Kali-linux
    [2] Instalar escritorios kali linux
    [3] Instalar menu de herramientas kali linux
    [4] Instalar todas las herramientas menu  kali linux
    [5] Salir
    [~]
    [~]~~>[kali-setting]~>$" menus
            case $menus in
            [1]* ) wget --no-check-certificate --continue https://http.kali.org/kali/pool/main/k/kali-archive-keyring/kali-archive-keyring_2022.1_all.deb && dpkg -i kali-archive-keyring_2022.1_all.deb && rm kali-archive-keyring_2022.1_all.deb 
                  menu ; break;;
            [2]* ) escritorios 
                   menu; break;;
            [3]* ) sudo apt-get install kali-menu -y
                   menu ; break;;
            [4]* ) install_aplications_all ; break;;
            [5]* ) exit ; break;;

* ) echo "opcion incorrecta.";;
    esac
    sleep 0.1
    clear
done

}

function escritorios(){
clear
cat .kali_banner.ans
setterm -foreground cyan
while true; do
    read -p "
 ~~> Creador: Comander747.
 ~~> Kali linux lite Termux
 ~~> Comunity hacking programations.
 ~~> github : https://github.com/capitancomando

    [~]~~>[MENU]
    [~]
    [1] Instalar escritorio xfce4 [recomendado]
    [2] Instalar escritorio mate
    [3] Instalar escritorio lxde
    [4] Instalar escritorio lxqt
    [5] Atras
    [~]
    [~]~~>[kali-setting]~>$" desktop
            case $desktop in
            [1]* ) bash de-apt-xfce4.sh ; break;;
            [2]* ) bash de-apt-mate.sh ; break;;
            [3]* ) bash de-apt-lxde.sh ; break;;
            [4]* ) bash de-apt-lxqt.sh ; break;;
            [5]* ) menu ; break;;

* ) echo "opcion incorrecta.";;
    esac
    sleep 0.1
    clear
done

}

function install_aplications_all(){
clear
cat .kali_banner.ans
setterm -foreground red

echo -ne "
 ~~> Creador: Comander747.
 ~~> Kali linux lite Termux
 ~~> Comunity hacking programations.
 ~~> github : https://github.com/capitancomando

    [~]~~>[MENU]
    [~]
    [1] Herramientas de ataque 802.11
    [2] Herramientas de ataque bluetooth
    [3] Herramientas de criptografía y steganografía
    [4] Menu de herramientas de assessment
    [5] Herramientas de exploits
    [6] Herramientas de forénsica
    [7] fuzzing attacks tools
    [8] GPU tools
    [9] hardware attacks tools
    [10] information gathering menu
    [11] password cracking tools menu
    [12] post exploitation tools menu
    [13] reporting tools menu
    [14] reverse engineering menu
    [15] RFID tools
    [16] SDR tools
    [17] sniffing & spoofing tools menu
    [18] social engineering tools menu
    [19] top 10 tools
    [20] VoIP tools
    [21] vulnerability analysis menu
    [22] webapp assessment tools menu
    [23] Windows resources
    [24] wireless tools menu
    [25] Atras...
    [~]

    [~]~~>[kali-setting]~>$"
    read -r ans
    case $ans in
            1 ) sudo apt-get install kali-tools-802-11 ;;                # Herramientas de ataque 802.11
            2 ) sudo apt-get install kali-tools-bluetooth ;;            # Herramientas de ataque bluetooth
            3 ) sudo apt-get install kali-tools-crypto-stego ;;         # Herramientas de criptografía y steganografía
            4 ) sudo apt-get install kali-tools-database  ;;            # Menu de herramientas de assessment
            5 ) sudo apt-get install kali-tools-exploitation   ;;    # Herramientas de exploits
            6 ) sudo apt-get install kali-tools-forensics  ;;     # Herramientas de forénsica
            7 ) sudo apt-get install kali-tools-fuzzing      ;;         # fuzzing attacks tools
            8 ) sudo apt-get install kali-tools-gpu         ;;          # GPU tools
            9 ) sudo apt-get install kali-tools-hardware      ;;        # hardware attacks tools
            10 ) sudo apt-get install kali-tools-information-gathering  ;; # information gathering menu
            11 ) sudo apt-get install kali-tools-passwords     ;;        # password cracking tools menu
            12 ) sudo apt-get install kali-tools-post-exploitation ;;    # post exploitation tools menu
            13 ) sudo apt-get install kali-tools-reporting     ;;        # reporting tools menu
            14 ) sudo apt-get install kali-tools-reverse-engineering ;; # reverse engineering menu
            15 ) sudo apt-get install kali-tools-rfid    ;;     # RFID tools
            16 ) sudo apt-get install kali-tools-sdr     ;;              # SDR tools
            17 ) sudo apt-get install kali-tools-sniffing-spoofing ;;    # sniffing & spoofing tools menu
            18 ) sudo apt-get install kali-tools-social-engineering ;;   # social engineering tools menu
            19 ) sudo apt-get install kali-tools-top10      ;;           # top 10 tools
            20 ) sudo apt-get install kali-tools-voip     ;;             # VoIP tools
            21 ) sudo apt-get install kali-tools-vulnerability   ;;     # vulnerability analysis menu
            22 ) sudo apt-get install kali-tools-web     ;;              # webapp assessment tools menu
            23 ) sudo apt-get install kali-tools-windows-resources ;;    # Windows resources
            24 ) sudo apt-get install kali-tools-wireless   ;;
            25 ) menu ;;

            *)
        echo "Wrong option."
        exit 1
        ;;
    esac
}


menu

