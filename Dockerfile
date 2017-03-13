FROM registry.ng.bluemix.net/ibmnode:v4

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies, assuming npm is already installed on the image
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source code inside the docker image
COPY . /usr/src/app

RUN ls -la /usr/src/app/*

RUN /bin/bash -c 'source /usr/src/app/dot-env; echo $DEVMODE'


#have the docker daemon bind the app to port 8080
EXPOSE 3000

#command to run the app (see "start" in package.json)
CMD [ "npm", "start" ]