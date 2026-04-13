FROM node:18-bullseye-slim

# Instalar dependências do sistema para o canvas
RUN apt-get update && apt-get install -y \
    build-essential \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    libpixman-1-dev \
    pkg-config \
    python3 \
    && rm -rf /var/lib/apt/lists/*

# Criar diretório da aplicação
WORKDIR /app

# Copiar package.json primeiro (para cache de camadas)
COPY package*.json ./

# Instalar dependências do Node
RUN npm ci --only=production

# Copiar o resto do código
COPY . .

# Comando para iniciar
CMD ["node", "index.js"]
