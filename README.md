<!DOCTYPE html>
<html>
<head>
<body bgcolor=black text=lime>

<center>
Kali linux lite es un script instalador de kali linux liviano
La instalacion se hace desde termux.

Este kali linux lite no contiene las herramientas
Que vienen en kali linux oficial, pero si posee sus repositorios
Para instalarlos desde la terminal.

Por lo tanto con kali linux lite puedes tener kali linux
Sin herramientas instaladas, para que tu instales las que necesites
Atu antojo.

Creador del script: Comander-747.

Configuracion By: Comander747

kali linux peso: 71 megas.

descomprimido: 450 megas.

con escritorio xfce: 1 giga

<h1> comandos de instalacion kali lite </h1>


     apt update && apt upgrade -y
     pkg install git wget
     git clone https://github.com/capitancomando/kali-lite/
     cd kali-lite 
     bash install-kali.sh

<h2>Comandos para ajecutar kali-linux</h2><br>

cd ~/kali-lite && ./start-kali.sh<br>
O escribe solo : kali

Una vez dentro de kali, ejecuta:  bash kali-setup.sh
<br>
<h2> Explicacion kali-setup.sh</h2><br>
Se abrira un menu y le das ala opcion 1 <br>
Luego para instalar un escritorio,le das ala opcion 2 y elige el escritorio que desees, recomiendo xfce4<br>
Luego ala opcion 3, y listo eso es todo lo necesario,<br>
En la opcion 4 Tienes todas las herramientas para instalar, pero eso es opcional.<br>


<h2>Comandos para abrir puerto local con vncserver</h2>
Abrir puerto:
$ vncserver-start

Luego seleccionas el puerto que quieras abrir, ejemplo 1

Cerrar puertos:
$ vncserver-stop <br>
Luego seleccionas el puerto que quieras cerrar, ejemplo 1

<h3> para ver el escritorio? </h3>
Necesitas la aplicacion vncviewer para emular el escritorio
O alguna otra.

Link: https://play.google.com/store/apps/details?id=com.realvnc.viewer.android

<br><h2> Explicacion de que hacer con la app vncserver</h2><br>
Una vez instalada la aplicacion vncviewer,<br>
Debes dar en la (+) cruz y luego en la opcion Address:<br>
Escribir:  localhost:1 <br>
Si es para abrir el puerto 1, depende del puerto que tengas, abierto en el 
Vncserver.<br>
Luego en la opcion name, escribes kali linux y seleccionas create y luego connect<br>

Escribes tu contrase??a de vncserver y listo.

<img src=".banner/kali-linux.png"
     alt="kali"
     width="800"
     height="200">

<img src=".banner/Screenshot_20221112-033001.png"
     alt="Install Nahfer os"
     width="420"
     height="620">

</center></body></head></html>



