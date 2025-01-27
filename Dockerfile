FROM node:14-alpine as nodestage
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build



FROM nginx
COPY --from=nodestage /app/build /usr/share/nginx/html