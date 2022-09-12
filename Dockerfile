FROM node:16.16.0

WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
ENV PORT 80

COPY package*.json ./
RUN npm install --only=production
COPY . ./

EXPOSE 80
CMD ["npm", "start"]