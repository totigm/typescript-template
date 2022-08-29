# Build TS project into JS code
FROM node:16-alpine AS builder

WORKDIR /app

COPY . .

RUN npm install && npm run build

# Get JS code and install production dependencies only
FROM node:16-alpine AS production

WORKDIR /app

ENV NODE_ENV=prod

COPY --from=builder ./app/dist ./dist 
COPY package*.json .

RUN npm install --omit=dev

CMD npm run prod
