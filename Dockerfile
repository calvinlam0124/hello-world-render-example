
FROM node:23.7.0-bookworm-slim AS node-builder
WORKDIR /app
COPY . /app
RUN npm install

FROM node:23.7.0-bookworm-slim
WORKDIR /app
COPY . .
COPY --from=node-builder /app/node_modules/ /app/node_modules
CMD ["node", "app.js"]
