#!/bin/bash
#java -version #verifica versao atual do java
#java -jar trackingMonitor.jar
ls | grep "trackingMonitor.jar"

if [ $? = 0 ]; #se retorno for igual a 0
then #entao,
echo “jar instalado” #print no terminal
else #se nao,
echo “jar não instalado” #print no terminal
echo “gostaria de instalar o jar? [s/n]” #print no terminal

read get #variável que guarda resposta do usuário

if [ \“$get\” == \“s\” ]; #se retorno for igual a s
then #entao
wget https://raw.githubusercontent.com/Tracking-Digital-Solution/jar/main/trackingMonitor.jar #executa instalacao do java

echo "Executando jar"
sleep 2

java -jar trackingMonitor.jar
fi #fecha o 2º if
fi #fecha o 1º if