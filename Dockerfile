# -------- Build Stage --------
FROM node:20 AS build
WORKDIR /app

COPY package*.json ./
RUN npm install --production

COPY . .

FROM node:20-slim
WORKDIR /app

COPY --from=build /app .

EXPOSE 3000
CMD ["node", "index.js"]
