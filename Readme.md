
 # Sample Command


### Build image from Dockerfile
 - docker build . -t {REPO}/{IMAGE_NAME}:{TAG}

### Run the image
 - docker run  {REPO}/{IMAGE_NAME}:{TAG}

### Run using docker-compose
 - docker-compose up --scale hycon-seed=1 -d

### Kill all the containers
 - docker kill $(docker ps -a -q) 

### Delete all the containers
 - docker rm $(docker ps -a -q)

For more information see Dockerfile and docker-compose.yml

