
FROM node:22-alpine

WORKDIR /app

COPY package*.json ./
COPY prisma ./prisma/
RUN npm install

COPY . .

RUN npx prisma generate
RUN npx prisma db pull

EXPOSE 5555

CMD [ "sh", "-c", "npx prisma studio" ]
