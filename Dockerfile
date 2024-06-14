FROM node:14 AS build
WORKDIR /app
RUN npm install
COPY package.json package-lock.json ./
COPY . .
RUN npm run build

FROM node:latest
WORKDIR /app
COPY --from=build /app/build ./build
EXPOSE 8000
CMD ["npm", "start"]
