FROM node:19
COPY . /app
WORKDIR /app
RUN npm i
EXPOSE 3000
CMD ["npm", "start"]