#!/bin/bash

DIR_ORIGEM="/app/doacoes"
DIR_DESTINO="/app/backups"
LOG_FILE="/app/logs/backup.log"

DATA_HORA=$(date '+%Y-%m-%d_%H-%M')
NOME_BACKUP="backup_doacoes_${DATA_HORA}.tar.gz"
ARQUIVO_DESTINO="${DIR_DESTINO}/${NOME_BACKUP}"

realizar_backup() {
    echo "A iniciar o backup do Sistema de Doacoes..."
    echo "Diretorio de origem: $DIR_ORIGEM"
    echo "Diretorio de destino: $DIR_DESTINO"

    mkdir -p "$DIR_DESTINO"

    tar -czf "$ARQUIVO_DESTINO" "$DIR_ORIGEM" > /dev/null 2>&1

    if [ -f "$ARQUIVO_DESTINO" ]; then
        echo "Sucesso: Backup do sistema criado com exito!"
        echo "Ficheiro gerado: $ARQUIVO_DESTINO"
        
        echo "$(date '+%Y-%m-%d %H:%M:%S') - SUCESSO - Backup gerado: $NOME_BACKUP" >> "$LOG_FILE"
        
        ls -lh "$ARQUIVO_DESTINO"
    else
        echo "Falha: Ocorreu um erro ao gerar o backup das doacoes."
        echo "$(date '+%Y-%m-%d %H:%M:%S') - FALHA - Erro ao gerar backup" >> "$LOG_FILE"
    fi
}

realizar_backup