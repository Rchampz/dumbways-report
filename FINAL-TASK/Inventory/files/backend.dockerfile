FROM node:10-alpine
WORKDIR /app
COPY . .
RUN npm install
RUN npm install -g sequelize sequelize-cli
RUN npm install -g pg --save
EXPOSE 5000
CMD npm start ; sequelize db:migrate