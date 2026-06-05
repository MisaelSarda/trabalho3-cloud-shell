#!/bin/bash

VERDE='\033[0;32m'
AZUL='\033[0;34m'
NC='\033[0m' # Sem Cor

mostrar_menu() {
    clear
    echo -e "${AZUL}====================================================${NC}"
    echo -e "${VERDE}               MENU DEVOPS CLOUD                    ${NC}"
    echo -e "${AZUL}====================================================${NC}"
    echo "Criado por: Misael Pablo Sarda"
    echo "Instituição: Unidavi"
    echo "Tema: Sistema de Doacao de Roupas e Alimentos"
    echo -e "${AZUL}====================================================${NC}"
    echo "1 - Atualizar sistema"
    echo "2 - Instalar Apache"
    echo "3 - Criar estrutura do projeto"
    echo "4 - Realizar backup"
    echo "5 - Fazer deploy"
    echo "6 - Ver processos"
    echo "7 - Monitorar sistema"
    echo "8 - Configurar usuarios e permissoes"
    echo "9 - Gerar relatorio"
    echo "0 - Sair"
    echo -e "${AZUL}====================================================${NC}"
    echo -n "Escolha uma opcao: "
}

while true; do
    mostrar_menu
    read opcao

    case $opcao in
        1)
            echo -e "\n${VERDE}A executar: Atualizacao do Sistema...${NC}"
            /app/scripts/01_update.sh
            ;;
        2)
            echo -e "\n${VERDE}A executar: Instalacao do Apache...${NC}"
            /app/scripts/02_apache.sh
            ;;
        3)
            echo -e "\n${VERDE}A executar: Criacao da Estrutura...${NC}"
            /app/scripts/03_estrutura.sh
            ;;
        4)
            echo -e "\n${VERDE}A executar: Backup...${NC}"
            /app/scripts/04_backup.sh
            ;;
        5)
            echo -e "\n${VERDE}A executar: Deploy do Site...${NC}"
            /app/scripts/05_deploy.sh
            ;;
        6)
            echo -e "\n${VERDE}A executar: Gestao de Processos...${NC}"
            /app/scripts/06_processos.sh
            ;;
        7)
            echo -e "\n${VERDE}A executar: Monitorizacao do Sistema...${NC}"
            /app/scripts/07_monitoramento.sh
            ;;
        8)
            echo -e "\n${VERDE}A executar: Configuracao de Usuarios...${NC}"
            /app/scripts/08_usuarios_permissoes.sh
            ;;
        9)
            echo -e "\n${VERDE}A executar: Relatorio Operacional...${NC}"
            /app/scripts/09_relatorio.sh
            ;;
        0)
            echo -e "\n${VERDE}A sair do Sistema de Doacoes. Ate logo!${NC}"
            exit 0
            ;;
        *)
            echo -e "\n\033[0;31mOpcao invalida! Tente novamente.\033[0m"
            ;;
    esac
    
    echo -e "\nPrima [ENTER] para voltar ao menu..."
    read
done