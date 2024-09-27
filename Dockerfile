FROM node:21.7.3-alpine

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npx", "nodemon", "--watch", "src", "--exec", "ts-node", "src/index.ts"]
#CMD ["npm", "start"]