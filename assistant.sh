#!/bin/bash

PURPLE='0;35'
NC='\033[0m' 
VERSAO=11

echo  "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7) TRACKING MONITOR ASSISTANT"
echo  "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7) Olá! serei seu assistente de instalação"
sleep 2

#verifica se você já possui o Java instalado
echo  "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Verificando se você possui o Java instalado..."
sleep 2

java -version
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7) : Você já tem o java instalado!!"
		sleep 2
	else
		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Você NÃO possui o Java instalado! você gostaria de instalar?"
		sleep 2
		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o Java (y/n)?"		
	read inst
	if [ \"$inst\" == \"y\" ]
		then
			echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Ok! Você escolheu instalar o Java"
			sleep 2
			sudo apt install openjdk-17-jre -y
		else 	
		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Você optou por não instalar o Java por enquanto!"
		sleep 1
	fi
fi

#Verifica se você já possui o Docker instalado
echo  "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Verificando se você possui o Docker instalado..."
sleep 1

docker --version
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7) : Você já tem o Docker instalado!!"
		sleep 2
	else
		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Você NÃO possui o Docker instalado! você gostaria de instalar?"
		sleep 2
		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o Docker (y/n)?"		
	read inst
	if [ \"$inst\" == \"y\" ]
		then
			echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Ok! Você escolheu instalar o Docker"
			sleep 2
			sudo apt install docker.io
			clear
		else 	
		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Você optou por não instalar o Docker por enquanto!"
		sleep 1
	fi
fi


#Verifica se você já possui o Jar instalado
echo  "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Verificando se você possui nossa aplicação instalada..."
sleep 1

ls | grep "Monitor.jar"
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7) : Você já tem nossa aplicação instalada!!"
		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Executando a aplicação..."
			sleep 1
				cd cd Tracking-Digital-Solution-Jar-Azure-Mysql/
			java -jar "Monitor.jar"
		sleep 2
	else
		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Você NÃO possui nossa aplicação! você gostaria de instalar?"
		sleep 2
		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o Tracking Monitor (y/n)?"		
	read inst
	if [ \"$inst\" == \"y\" ]
		then
			echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Ok! Você escolheu instalar o Tracking Monitor"
			sleep 2
		    git clone https://github.com/Tracking-Digital-Solution/Tracking-Digital-Solution-Jar-Azure-Mysql.git
				cd cd Tracking-Digital-Solution-Jar-Azure-Mysql/

			sleep 1
			java -jar Monitor.jar
		else 	
		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Você optou por não instalar nossa aplicação por enquanto, Tchau!"
		sleep 1
	fi
fi


# ls | grep "Monitor.jar"
# if [ $? -eq 0 ]
# 	then
# 		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7) : Você já tem nossa aplicação instalada!!"
# 		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Executando a aplicação..."
# 			sleep 1
# 			java -jar "Monitor.jar"
# 		sleep 2
# 	else
# 		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Você NÃO possui nossa aplicação! você gostaria de instalar?"
# 		sleep 2
# 		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o Tracking Monitor (y/n)?"		
# 	read inst
# 	if [ \"$inst\" == \"y\" ]
# 		then
# 			echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Ok! Você escolheu instalar o Tracking Monitor"
# 			sleep 2
# 		wget https://raw.githubusercontent.com/Tracking-Digital-Solution/Tracking-Digital-Solution-Jar-Azure-Mysql/main/Monitor.jar #executa instalacao do java
# 			echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Executando a aplicação..."
# 			sleep 1
# 			java -jar Monitor.jar
# 		else 	
# 		echo "$(tput setaf 10)[Tracking assistant]:$(tput setaf 7)  Você optou por não instalar nossa aplicação por enquanto, Tchau!"
# 		sleep 1
# 	fi
# fi
