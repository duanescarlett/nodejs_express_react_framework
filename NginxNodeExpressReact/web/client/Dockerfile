FROM node:10 as react-build

WORKDIR ./

COPY package*.json ./

COPY . .

RUN npm install

RUN npm audit fix

CMD ["npm", "start"]