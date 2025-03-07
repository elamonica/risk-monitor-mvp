FROM node:20-alpine
# Installing libvips-dev for sharp Compatibility
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev vips-dev git

WORKDIR /srv/app

# Copy package.json and yarn.lock files
COPY ./app/package.json ./
COPY ./app/yarn.lock ./

# Install dependencies and clean cache
RUN yarn config set network-timeout 600000 -g && yarn install

# Copy the app
COPY ./app .

# Build Strapi admin
RUN yarn build

EXPOSE 1337
CMD ["yarn", "develop"]