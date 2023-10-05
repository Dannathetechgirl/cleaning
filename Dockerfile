# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src

# Copy package.json and package-lock.json (if available) to the container
COPY package*.json ./

# Install project dependencies
RUN npm install

# If you're building the code for production, run:
# RUN npm ci --only=production

# Copy the entire project to the container (you might want to use .dockerignore)
COPY . .

# Compile TypeScript to JavaScript
RUN npm run build

# Expose the port your app runs on
EXPOSE 3000

# Command to run the application
CMD [ "node", "build/index.js" ]

