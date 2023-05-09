#!/bin/bash

PURPLE='0;35'
NC='\033[0m' 
VERSAO=11
	
echo  "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7) Olá! serei seu assistente para instalação do Java!;"
sleep 2
echo  "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Verificando se você possui o Java instalado...;"
sleep 2

java -version
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7) : Olá você já tem o java instalado!!"
		sleep 2
	else
		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Opa! Não identifiquei nenhuma versão do Java instalado, mas sem problemas, irei resolver isso agora!"
		sleep 2
		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o Java (Y/n)?"		
	read inst
	if [ \"$inst\" == \"Y\" ]
		then
			echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Ok! Você escolheu instalar o Java ;D"
			sleep 2
			echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Adicionando o repositório!"
			sleep 2
			sudo add-apt-repository ppa:webupd8team/java -y
			clear
			echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Atualizando Pacotes! Quase lá."
			sleep 2
			sudo apt update -y
			clear
			
			if [ $VERSAO -eq 11 ]
				then
					echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7) Preparando para instalar a versão 11 do Java. Confirme a instalação quando solicitado ;D"
					sleep 1
					sudo apt install default-jre ; apt install openjdk-11-jre-headless; -y
					clear
					echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7) Java instalado com sucesso!"
					sleep 1
				fi
		else 	
		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Você optou por não instalar o Java por enquanto, até a próxima então!"
		sleep 1
	fi
fi

#Verifica instalação do trackingMonitor.jar

ls | grep "trackingMonitor.jar"

if [ $? = 0 ]; #se retorno for igual a 0
then #entao,
    echo  "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Você já possui nossa aplicação trackingMonitor!;"
else #se nao,
    echo  "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Você ainda NÃO possui nossa aplicação trackingMonitor!;"

	echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Gostaria de instalar nossa aplicação (Y/n)?"		
	read inst

if [ \"$inst\" == \"Y\" ]; 
then #entao
wget https://raw.githubusercontent.com/Tracking-Digital-Solution/jar/main/trackingMonitor.jar #executa instalacao do java

echo  "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  executando jar....!;"
sleep 2

java -jar trackingMonitor.jar
fi #fecha o 2º if
fi #fecha o 1º if

# ===================================================================
# Todos direitos reservados para o autor: Dra. Profa. Marise Miranda.
# Sob licença Creative Commons @2020
# Podera modificar e reproduzir para uso pessoal.
# Proibida a comercialização e a exclusão da autoria.
# ===================================================================
