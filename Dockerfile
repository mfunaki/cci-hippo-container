FROM node:current-bullseye-slim

WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
ENV PORT 80

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libpcre2-8-0 \
    zlib1g \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*

COPY package*.json ./
RUN npm install --only=production
COPY . ./

EXPOSE 80
CMD ["npm", "start"]