FROM node as ngbuilder
WORKDIR /app
COPY ./package.json .
RUN yarn install
COPY . .
RUN yarn run build

FROM nginx
COPY --from=ngbuilder /app/build /usr/share/nginx/html
