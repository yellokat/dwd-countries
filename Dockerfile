FROM node:22.0.0
WORKDIR /usr/src/app
COPY . .
RUN npm install
RUN npm install -g serve
RUN npm run lint
RUN npm run build
EXPOSE 5000
CMD ["serve", "-s", "-l", "5000", "dist"]