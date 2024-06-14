FROM node:14 AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

FROM node:latest
WORKDIR /app
COPY --from=build /app/build ./build
EXPOSE 8000
CMD ["npm", "start"]
