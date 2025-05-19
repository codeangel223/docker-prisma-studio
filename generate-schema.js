// generate-schema.ts
const fs = require("fs")
const dotenv = require("dotenv")

dotenv.config();

const DB_URL = process.env.DATABASE_URL
const provider = DB_URL.split("://")[0];
const url = 'env("DATABASE_URL")';

const schema = `
generator client {
  provider = "prisma-client-js"
  output   = "../generated/prisma"
}

datasource db {
  provider = "${provider}"
  url      = ${url}
}
`;

fs.writeFileSync("prisma/schema.prisma", schema);
console.log("✅ schema.prisma généré avec provider:", provider);
