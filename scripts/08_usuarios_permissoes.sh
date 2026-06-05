#!/bin/bash

LOG_FILE="/app/logs/permissoes.log"
GRUPO="equipa_doacoes"
VOLUNTARIO_ROUPAS="voluntario_r"
VOLUNTARIO_ALIMENTOS="voluntario_a"
PASTA_BASE="/app/doacoes"

configurar_acessos() {
    echo "A configurar acessos para os voluntarios do portal..."

    echo "A criar o grupo: $GRUPO"
    groupadd "$GRUPO" 2>/dev/null || echo "Aviso: O grupo $GRUPO ja existe."

    echo "A criar contas para os voluntarios..."
    useradd -m -g "$GRUPO" -s /bin/bash "$VOLUNTARIO_ROUPAS" 2>/dev/null || echo "Aviso: Utilizador $VOLUNTARIO_ROUPAS ja existe."
    useradd -m -g "$GRUPO" -s /bin/bash "$VOLUNTARIO_ALIMENTOS" 2>/dev/null || echo "Aviso: Utilizador $VOLUNTARIO_ALIMENTOS ja existe."

    echo "A aplicar regras de seguranca na pasta $PASTA_BASE..."
    
    mkdir -p "$PASTA_BASE"
    
    chown -R root:"$GRUPO" "$PASTA_BASE"
    
    chmod -R 770 "$PASTA_BASE"

    echo "$(date '+%Y-%m-%d %H:%M:%S') - SUCESSO - Utilizadores ($VOLUNTARIO_ROUPAS, $VOLUNTARIO_ALIMENTOS) e permissoes configurados." >> "$LOG_FILE"

    echo "Sucesso: Acessos configurados com seguranca!"
    
    echo ""
    echo "--- Validacao das Permissoes ---"

    id "$VOLUNTARIO_ROUPAS"

    ls -ld "$PASTA_BASE"
}

configurar_acessos