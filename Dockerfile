# build stage 1
FROM node:18-alpine AS builder
WORKDIR /app

COPY package.*json ./
RUN npm install
COPY . .
RUN npm run build

# build stage 2 (production)
FROM node:18-alpine
WORKDIR /app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY package.*json ./
RUN npm install --omit=dev

COPY --from=builder --chown=appuser:appgroup /app/build ./build

USER appuser
EXPOSE 3000
CMD [ "node", "build/index.js" ]

