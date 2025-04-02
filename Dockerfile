FROM node:22.0.0 AS build-stage
WORKDIR /usr/src/app
COPY . .
RUN npm install && \
    npm install -g serve && \
    npm run lint && \
    npm run build

FROM nginx:1.19-alpine
COPY --from=build-stage /usr/src/app/dist/ /usr/share/nginx/html