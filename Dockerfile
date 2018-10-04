FROM node:10.11

RUN mkdir /app

WORKDIR /app

COPY . /app

RUN yarn install

EXPOSE 3000

CMD [ "yarn", "start" ]
