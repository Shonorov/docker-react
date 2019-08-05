# Build your application inside node:alpine image
FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm", "run", "build"]

# Install nginx image and copy build folder into it
FROM nginx
EXPOSE: 80
COPY --from=builder /app/build /usr/share/nginx/html
