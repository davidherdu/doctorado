# Use the official Node.js image as the base image
FROM node:18

# Set the working directory
WORKDIR /usr/app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the app code to the container
COPY . .

# Expose the port on which KeystoneJS will run
EXPOSE 3000

# Set the startup command
CMD ["npm", "start"]
#CMD yarn dev -p 3000
