#!/bin/bash

LOG_FILE="/app/logs/monitoramento.log"

monitorizar_recursos() {
    echo "A iniciar a monitorizacao de recursos do servidor de doacoes..."
    DATA=$(date '+%Y-%m-%d %H:%M:%S')
    
    echo "=====================================" >> "$LOG_FILE"
    echo "Relatorio de Monitorizacao - $DATA" >> "$LOG_FILE"
    
    echo ""
    echo "--- Uso de Memoria RAM ---"

    free -h

    echo "--- Memoria RAM ---" >> "$LOG_FILE"
    free -h >> "$LOG_FILE"
    
    echo ""
    echo "--- Uso de Espaco em Disco ---"

    df -h /
    

    echo "--- Espaco em Disco ---" >> "$LOG_FILE"
    df -h / >> "$LOG_FILE"
    
    echo ""
    echo "Sucesso: Dados de monitorizacao registados em $LOG_FILE"
}

monitorizar_recursos