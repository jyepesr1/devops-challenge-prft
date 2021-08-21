FROM node:12

# Create app directory
WORKDIR /usr/src/app

ENV CHAMBER_SECRET_BACKEND=secretsmanager AWS_REGION=us-east-1
ARG CHAMBER_VERSION=v2.10.1
# Production uses chamber to inject secrets into ENV from AWS
RUN curl -Ls https://github.com/segmentio/chamber/releases/download/${CHAMBER_VERSION}/chamber-${CHAMBER_VERSION}-linux-amd64 > /usr/local/bin/chamber

RUN chmod a+x /usr/local/bin/chamber


# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8080
ENTRYPOINT chamber exec johanyepes-demo-app -- npm start
