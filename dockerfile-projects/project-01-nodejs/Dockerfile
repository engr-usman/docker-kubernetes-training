FROM node:18-slim
WORKDIR /app

# Copy dependency manifests first for better layer caching
COPY package*.json ./

# Install dependencies
RUN npm install --omit=dev

# Copy the rest of the app
COPY . .

EXPOSE 3000
CMD ["node", "server.js"]