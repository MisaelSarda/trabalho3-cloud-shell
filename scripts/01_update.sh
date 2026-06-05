#!/bin/bash

atualizar_sistema() {
    echo "Iniciando atualização do servidor do Sistema de Doacoes"
    apt update && apt upgrade -y

    if [ $? -eq 0 ]; then
        echo "Sucesso: Servidor de doacoes atualizado com sucesso!"
        echo "$(date '+%Y-%m-%d %H:%M:%S') - SUCESSO - Sistema de Doacoes atualizado" >> /app/logs/update.log
    else
        echo "Falha: Erro ao atualizar o servidor de doacoes!"
        echo "$(date '+%Y-%m-%d %H:%M:%S') - ERRO - Erro na atualizacao do sistema." >> /app/logs/update.log
    fi
}

atualizar_sistema