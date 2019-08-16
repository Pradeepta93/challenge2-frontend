#Install correct Node image
FROM node:alpine
#Install Dependencies
RUN apk update  && apk add  openssl zip unzip git wget curl
#Set working directory to app
WORKDIR /app
RUN git clone https://github.com/zurez/challenge2-frontend.git 
#Change current workdir to cloned directory
WORKDIR /app/challenge2-frontend
#Install application depenencies
RUN npm install
#Start application
#Learn about CMD vs RUN
CMD npm start
#Open Port 
EXPOSE 3000
