FROM node:10

RUN npm install webpack webpack-cli -g

WORKDIR /app

COPY ./package.json /app/package.json
COPY ./yarn.lock /app/yarn.lock

RUN yarn install

COPY . /app

RUN webpack

EXPOSE 3000

CMD [ "yarn", "start" ]
