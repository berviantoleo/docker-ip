FROM node:10-alpine
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn
COPY . .
EXPOSE 80
ENTRYPOINT [ "node", "index.js" ]