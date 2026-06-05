#!/bin/bash

LOG_FILE="/app/logs/processos.log"

verificar_processos() {
    echo "A analisar os processos do servidor do Sistema de Doacoes..."
    
    DATA=$(date '+%Y-%m-%d %H:%M:%S')
    echo "=====================================" >> "$LOG_FILE"
    echo "Analise de Processos - $DATA" >> "$LOG_FILE"
    

    echo "--- Estado do Servidor Web ---"
    if pgrep -x "apache2" > /dev/null; then
        echo "Estado: Apache2 esta a correr perfeitamente."
        echo "Apache2: ATIVO" >> "$LOG_FILE"
    else
        echo "ALERTA: O Apache2 não está a correr!"
        echo "Apache2: INATIVO" >> "$LOG_FILE"
    fi

    echo ""
    echo "--- Top 5 Processos (Consumo de Memoria) ---"

    ps -eo pid,comm,%mem,%cpu --sort=-%mem | head -n 6
    
    ps -eo pid,comm,%mem,%cpu --sort=-%mem | head -n 6 >> "$LOG_FILE"
    
    echo ""
    echo "Sucesso: Registo de processos guardado em $LOG_FILE"
}

verificar_processos