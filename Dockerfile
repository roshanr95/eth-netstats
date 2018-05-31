# Base node image
FROM node:10-alpine

# Port exposed by eth-netstats
EXPOSE 3000

# Working directory with proper permissions
WORKDIR /home/node/eth-netstats/
RUN chown node /home/node/eth-netstats/

# Copy code
COPY --chown=node . .

# Set production environment
ARG NODE_ENV=production
ENV NODE_ENV="${NODE_ENV}"

# Install dependencies and run as node user
RUN npm install -g grunt-cli
USER node
RUN npm install
RUN grunt
CMD npm start
