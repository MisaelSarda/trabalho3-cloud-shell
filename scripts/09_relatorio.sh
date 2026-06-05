#!/bin/bash

RELATORIO="/app/logs/relatorio_execucao.txt"
DATA_HORA=$(date '+%Y-%m-%d %H:%M:%S')
NOME_PROJETO="Sistema de Doacao de Roupas e Alimentos"
TEMA_ALUNO="Doacao de Roupas e Alimentos"

gerar_relatorio() {
    echo "A gerar o relatorio operacional do sistema."

    {
        echo "=========================================================="
        echo "           RELATORIO OPERACIONAL DO SISTEMA               "
        echo "=========================================================="
        echo "Data e Hora: $DATA_HORA"
        echo "Projeto: $NOME_PROJETO"
        echo "Tema: $TEMA_ALUNO"
        echo "=========================================================="

        echo ""
        echo "--- 1. Espaco em Disco ---"
        df -h /

        echo ""
        echo "--- 2. Uso dos Diretorios do Sistema ---"

        du -sh /app/doacoes/* 2>/dev/null || echo "Nenhum dado encontrado nas pastas."

        echo ""
        echo "--- 3. Estado do Servidor Web (Apache) ---"
        if pgrep -x "apache2" > /dev/null; then
            echo "Estado: ATIVO (A correr)"
        else
            echo "Estado: INATIVO (Parado)"
        fi

        echo ""
        echo "--- 4. Ultimos Backups Gerados ---"
        ls -lh /app/backups/ | tail -n 5

        echo ""
        echo "--- 5. Ultimos Logs Registados ---"
        ls -lh /app/logs/ | tail -n 5

        echo ""
        echo "--- 6. Ficheiros Publicados (Deploy) ---"
        ls -lh /var/www/html/ | tail -n 5

        echo ""
        echo "--- 7. Utilizadores e Permissoes (Equipa Doacoes) ---"
        grep "equipa_doacoes" /etc/group
        ls -ld /app/doacoes/

        echo "=========================================================="
        echo "Fim do Relatorio"
        echo "=========================================================="
    } > "$RELATORIO"

    echo "Sucesso: Relatorio gerado e guardado em $RELATORIO"
    echo ""
    echo "--- Visualizacao do Relatorio ---"

    cat "$RELATORIO"
}

gerar_relatorio