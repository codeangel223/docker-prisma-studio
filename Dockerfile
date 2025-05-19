

FROM node:22-alpine AS builder

WORKDIR /app

COPY package*.json generate-schema.js ./

RUN npm install --omit=dev

RUN npm install prisma

COPY prisma ./prisma/
FROM node:22-alpine

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 5555

CMD [ "sh", "-c", "npm run generate:schema && npx prisma db pull && npx prisma studio" ]

