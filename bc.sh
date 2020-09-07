#!/bin/bash 
echo 'Iniciando provisionamiento:bc'  
sudo apt-get update  
sudo apt-get install -y nginx  
sudo service nginx stop  
sudo rm -rf /etc/nginx/sites-enabled/default  
sudo touch /etc/nginx/sites-enabled/default  
echo "upstream testapp {      
    server 192.168.5.11;      
    server 192.168.5.12;  
    } 
server {      
    listen 80 default_server;      
    listen [::]:80 default_server ipv6only=on;     
    root /usr/share/nginx/html;      
    index index.html index.htm;     
    # Configurar sitio accesible desde http://localhost/      
    server_name localhost;     location / {          
        proxy_pass http://testapp;
         } 
         }" >> /etc/nginx/sites-enabled/default  
         sudo service nginx start  
         echo "Servidor: bc" > /var/www/html/index.html  
         echo 'Provisionamiento de bc completado'