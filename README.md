# Prisma DB Viewer 🧩

Ce conteneur Docker permet de lancer **Prisma Studio** pour explorer une base de données PostgreSQL, en utilisant une URL de connexion dynamique (`DATABASE_URL`).

> ⚠️ La base de données **n’est pas incluse** dans ce conteneur. Tu dois fournir la variable `DATABASE_URL` au moment du lancement.

## 📦 Une image prête à l’emploi est disponible sur Docker Hub : [codeangeldev/prisma-studio](https://hub.docker.com/r/codeangel223/prisma-studio)

## 🛠️ Prérequis

- Une base de données **PostgreSQL** accessible (locale, distante ou dans un autre conteneur)
- Docker installé sur ta machine

---

## 🔧 Construction de l’image

```bash
docker build -t prisma-studio .
```

---

## 🚀 Lancement avec une `DATABASE_URL`

```bash
docker run -p 5555:5555 \
  -e DATABASE_URL="postgresql://user:pass@<host>:5432/<dbname>" \
  prisma-studio
```

Remplace `<host>`, `<dbname>`, `user`, et `pass` selon ta configuration.

---

## 🌐 Valeurs possibles pour `<host>`

- ✅ **IP privée ou publique** (ex. `172.17.0.2` ou `192.168.1.100`)
- ✅ **Nom de domaine** (ex. `db.example.com`)
- ✅ **Nom d’un conteneur Docker** (si les deux conteneurs partagent un réseau Docker)
- ✅ **`host.docker.internal`** : si la base tourne sur ta machine (uniquement sur **macOS** ou **Windows**)

---

## 🖥️ Accès à Prisma Studio

Une fois lancé, Prisma Studio est disponible à l’adresse :

```
http://localhost:5555
```

---

## 💡 Exemple

```bash
docker run -p 5555:5555 \
  -e DATABASE_URL="postgresql://postgres:mysecretpassword@host.docker.internal:5432/mydb" \
  prisma-studio
```

---

## 📂 Structure attendue

Le projet doit inclure un dossier `prisma/` contenant au minimum un fichier `schema.prisma`.
