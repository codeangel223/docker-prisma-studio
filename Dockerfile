

FROM node:22-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install --omit=dev

COPY prisma ./prisma/
RUN npm install prisma && npx prisma generate

FROM node:22-alpine

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 5555

CMD [ "sh", "-c", "npx prisma db pull && npx prisma studio" ]
