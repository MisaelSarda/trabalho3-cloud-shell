# 📦 Projeto: Trabalho DevOps - Sistema de Doação de Roupas e Alimentos

## 👨 Informações do Aluno
- Nome: Misael Pablo Sarda
- Instituição: Unidavi
- Tema do Trabalho: Sistema de Doação de Roupas e Alimentos

##  Descrição do Cenário
Este projeto consiste na simulação de uma Devops baseada em contentores (Docker) para suportar o portal web de um Sistema de Doação de Roupas e Alimentos. O servidor, baseado num sistema operativo Linux (Ubuntu), foi configurado para hospedar o site da iniciativa solidária. Além disso,
 foram desenvolvidas rotinas de automação em Shell Script para facilitar a administração do servidor, incluindo atualização de pacotes, instalação do servidor web, estruturação de pastas, geração de backups, monitorização do sistema, deploy das páginas web e gestão dos utilizadores voluntários.

##  Tecnologias Utilizadas
- Docker & Docker Compose: Utilizados para a criação, configuração e orquestração do ambiente isolado (contentor).
- Ubuntu: Sistema operativo Linux base do servidor.
- Apache2: Servidor web responsável por hospedar e servir as páginas HTML do sistema de doações.
- ImageMagick: Pacote de manipulação de imagens adicionado para suportar futuras fotos de peças de roupa e alimentos.
- Shell Script (Bash): Linguagem utilizada para a criação dos scripts de automação do servidor.

##  Estrutura de Pastas do Projeto
- `docker-compose.yml` / `Dockerfile`: Ficheiros para construção da infraestrutura.
- `/scripts/`: Contém todos os 9 scripts de automação e o menu principal.
- `/source/`: Ficheiros originais do site (ex: `index.html`, `sobre.html`).
- `/evidencias/`: Contém os prints (capturas de ecrã) que comprovam a execução correta de cada etapa.
- `/logs/` (no contentor): Ficheiros de registo gerados pelos scripts.
- `/doacoes/` (no contentor): Estrutura de pastas temática do sistema (roupas, alimentos, etc.).

##  Explicação de Cada Script
1. `01_update.sh`: Executa a atualização da lista de pacotes (`apt update`) e dos pacotes instalados no Ubuntu (`apt upgrade`), registando o resultado no log.
2. `02_apache.sh`: Instala o servidor web Apache2 e a ferramenta complementar ImageMagick, iniciando o serviço de seguida.
3. `03_estrutura.sh`: Monta as pastas e ficheiros bases do projeto em `/app/doacoes/` (separando itens como roupas e alimentos) e remove estruturas antigas de forma segura.
4. `04_backup.sh`: Comprime a pasta completa do projeto gerando um ficheiro `.tar.gz` com a data e hora no nome, guardando em `/app/backups/`.
5. `05_deploy.sh`: Copia os ficheiros HTML da pasta de desenvolvimento (`source/`) para o diretório público do Apache (`/var/www/html/`), aplicando as permissões corretas.
6. `06_processos.sh`: Monitoriza o estado do Apache e lista no terminal e num ficheiro de log os 5 processos que mais consomem memória no sistema.
7. `07_monitoramento.sh`: Realiza um diagnóstico rápido dos recursos do servidor, exibindo o consumo de Memória RAM e Espaço em Disco (`df -h` e `free -h`).
8. `08_usuarios_permissoes.sh`: Cria um grupo `equipa_doacoes` e dois utilizadores para os voluntários do projeto, configurando permissões de acesso seguro (770) à pasta de doações.
9. `09_relatorio.sh`: Agrupa dados de estado do servidor, espaço em disco, últimos backups e últimos logs num único relatório textual.
10. `menu.sh`: Interface interativa que cria um painel no terminal para o administrador executar qualquer um dos 9 scripts anteriores digitando apenas uma opção.

##  Como Executar o Projeto

1. Clone o repositório na sua máquina.
2. No terminal da sua máquina raiz (na pasta do projeto), construa e inicie o contentor em segundo plano:
   ```bash
   docker compose up -d --build
3. Acesse o servidor linux
    "docker exec -it trabalho03-linux-doacoes bash"
4. Execute todos os scripts
    "chmod +x scripts/*.sh"
5. Se quiser executar os scripts individualmente utilize
    "./scripts/NOME_DO_SCRIPT.sh"
6. Execute o menu interativo
    "./scripts/menu.sh"
7. Após Executar todos os scripts abra o seu navegador de internet de
 preferência e digite o seguinte endereço: http://localhost:8080


## Evidências

Todas as evidências dos comandos utilizados estão disponíveis na pasta evidencias

## Link imagem DockerHub

No link https://hub.docker.com/repository/docker/misaelsarda/sistema-doacoes/general

## Principais dificuldades 

As dificuldades foram a parametrização do docker-compose.yml pois precisa s=estar certo para dar sequência no trabalho, a correta configuração do username para enviar a imagem para o DockerHub.

## utilização de IA

Utilizei como auxilio no projeto focado na resoluçaõ de erros de sintaxe para o Docker, obter as explicações dos erros e formatar os scripts conforme o exigido.