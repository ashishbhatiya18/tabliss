FROM node:latest as build
COPY . /app
WORKDIR /app
RUN npm install -D && npm run build


FROM nginx:alpine
COPY --from=build /app/dist/web /usr/share/nginx/html