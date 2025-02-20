import os
import random

def criar_arquivo(diretorio, nome_arquivo, tamanho_mb):
    """Cria um arquivo de tamanho específico dentro de um diretório."""
    if not os.path.exists(diretorio):
        os.makedirs(diretorio)  # Cria o diretório se não existir

    caminho_completo = os.path.join(diretorio, nome_arquivo)
    tamanho_bytes = tamanho_mb * 1024 * 1024  # Converter MB para Bytes
    
    with open(caminho_completo, 'wb') as f:
        f.write(os.urandom(tamanho_bytes))  # Gera bytes aleatórios
    
    print(f"Arquivo '{caminho_completo}' criado com {tamanho_mb}MB.")

# Definir pasta de destino
pasta_destino = "arquivos_gerados"

# Criar 20 arquivos com tamanhos aleatórios entre 1MB e 100MB
for i in range(1, 21):
    tamanho = random.randint(1, 100)  # Define tamanho aleatório
    nome = f"arquivo_{i}_{tamanho}MB.bin"  # Nome do arquivo
    criar_arquivo(pasta_destino, nome, tamanho)
