# build stage 1
FROM node:18.20-alpine AS builder
WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

# build stage 2 (production)
FROM node:18.20-alpine
WORKDIR /app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY package.json package-lock.json ./
RUN npm ci --omit=dev

COPY --from=builder --chown=appuser:appgroup /app/build ./build

USER appuser
EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=30s CMD wget -qO-  http://localhost:3000/health || exit 1

CMD [ "node", "build/index.js" ]

