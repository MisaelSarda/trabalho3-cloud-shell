#!/bin/bash

DIR_ORIGEM="/app/source"
DIR_DESTINO="/var/www/html"
LOG_FILE="/app/logs/deploy.log"

fazer_deploy() {
    echo "A iniciar o deploy do portal de doacoes..."
    
    if [ ! -d "$DIR_ORIGEM" ] || [ -z "$(ls -A "$DIR_ORIGEM")" ]; then
        echo "Falha: A pasta $DIR_ORIGEM nao existe ou esta vazia."
        echo "$(date '+%Y-%m-%d %H:%M:%S') - FALHA - Deploy cancelado, origem vazia" >> "$LOG_FILE"
        exit 1
    fi

    echo "A copiar ficheiros para o servidor web..."
    cp -r "$DIR_ORIGEM/"* "$DIR_DESTINO/"
    
    chown -R www-data:www-data "$DIR_DESTINO"
    chmod -R 755 "$DIR_DESTINO"
    
    if [ $? -eq 0 ]; then
        echo "Sucesso: Deploy do site de doacoes realizado com exito!"
        echo "$(date '+%Y-%m-%d %H:%M:%S') - SUCESSO - Deploy realizado em $DIR_DESTINO" >> "$LOG_FILE"
        echo "Ficheiros atualmente publicados no servidor:"
        ls -l "$DIR_DESTINO"
    else
        echo "Falha: Ocorreu um erro durante o deploy."
        echo "$(date '+%Y-%m-%d %H:%M:%S') - FALHA - Erro ao copiar ficheiros" >> "$LOG_FILE"
    fi
}

fazer_deploy