FROM node:22-alpine AS builder

RUN npm install -g pnpm

RUN mkdir /app
WORKDIR /app

COPY package.json pnpm-lock.yaml ./
RUN pnpm install
COPY . .

EXPOSE 4321
CMD ["pnpm", "astro", "dev", "--host", "0.0.0.0", "--port", "4321"]
