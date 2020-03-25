FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build ---> all the stuff

#Phase 2
FROM nginx
#Copy stuff from the previous phase 
COPY --from=builder /app/build /usr/share/nginx/html
