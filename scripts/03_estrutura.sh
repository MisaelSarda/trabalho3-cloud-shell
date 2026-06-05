#!/bin/bash

BASE_DIR="/app/doacoes"

criar_estrutura() {
    echo "A preparar a estrutura de diretorios do Sistema de Doacoes..."

    if [ -d "$BASE_DIR" ]; then
        echo "A remover estrutura antiga do sistema de doacoes..."
        rm -rf "$BASE_DIR"
    fi

    echo "A criar novas pastas para roupas, alimentos, logs, dados e publicacao..."
    mkdir -p "$BASE_DIR/roupas"
    mkdir -p "$BASE_DIR/alimentos"
    mkdir -p "$BASE_DIR/logs"
    mkdir -p "$BASE_DIR/dados"
    mkdir -p "$BASE_DIR/publicacao"

    echo "Sistema de Doacao - Base de Dados Inicializada" > "$BASE_DIR/dados/info.txt"
    touch "$BASE_DIR/roupas/inventario_roupas.txt"
    touch "$BASE_DIR/alimentos/inventario_alimentos.txt"

    echo "$(date '+%Y-%m-%d %H:%M:%S') - SUCESSO - Estrutura de diretorios do Sistema de Doacoes criada" >> /app/logs/estrutura.log

    echo "Sucesso: Estrutura de diretorios tematica criada com exito!"
    echo "Conteudo do diretorio $BASE_DIR:"
   
    ls -l "$BASE_DIR"
}

criar_estrutura