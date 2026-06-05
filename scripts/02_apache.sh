#!/bin/bash
instalar_apache() {
    echo "A iniciar a instalacao do Apache para o portal de doacoes..."
    apt install -y apache2 imagemagick > /dev/null 2>&1
    
    if [ $? -eq 0 ]; then
        echo "Sucesso: Apache e ferramentas de imagem instalados."
        echo "$(date '+%Y-%m-%d %H:%M:%S') - SUCESSO - Apache instalado" >> /app/logs/apache.log
        
        service apache2 start > /dev/null 2>&1
    else
        echo "Falha: Erro ao instalar o Apache."
        echo "$(date '+%Y-%m-%d %H:%M:%S') - FALHA - Erro na instalacao do Apache" >> /app/logs/apache.log
    fi
}

verificar_apache() {
    echo "A verificar o estado do servidor web de doacoes..."
    if pgrep -x "apache2" > /dev/null
    then
        echo "Estado: O servidor web do portal de doacoes ESTA A CORRER."
    else
        echo "Estado: O servidor web do portal de doacoes NAO ESTA A CORRER."
    fi
}

versao_apache() {
    echo "Versao do Apache instalada:"
    apache2 -v | head -n 1
}

instalar_apache
verificar_apache
versao_apache