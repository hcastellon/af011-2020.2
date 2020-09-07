#!/bin/bash 
echo 'Iniciando provisionamiento: web'$1  
sudo apt-get update  
sudo apt-get install -y nginx  
echo "<h1>Servidor: web"$1 "</h1>" > /var/www/html/index.html  
echo 'Provisionamiento web'$1 'completado'