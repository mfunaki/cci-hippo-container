FROM node:current-buster-slim

WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
ENV PORT 80

COPY package*.json ./
RUN npm install --only=production
COPY . ./

EXPOSE 80
CMD ["npm", "start"]