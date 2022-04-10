# Menu DB

##First window terminal
```
cd (directory with project)
docker-compose up -d
npx ts-node src/index.ts (server open in localhost:3000)
```

##2 window terminal
```
cd (directory with project)
npx prisma migrate dev —name init
node prisma seed.js
npx prisma studio (server open in localhost:5555)
```

##3 window terminal
```
npm run serve (vue server open in localhost:8080)
```