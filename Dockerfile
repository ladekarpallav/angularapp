FROM node:14.17.0 as ui-build
LABEL application="reactapp"
LABEL author="pallav"
WORKDIR  /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
FROM nginx
COPY --from=ui-build /app/dist /usr/share/nginx/html
