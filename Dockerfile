FROM node:latest as build
COPY . /app
WORKDIR /app
ARG UNSPLASH_API_KEY
ENV UNSPLASH_API_KEY=$UNSPLASH_API_KEY
RUN npm install -D && npm run build


FROM nginx:alpine
COPY --from=build /app/dist/web /usr/share/nginx/html