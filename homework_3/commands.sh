# checking if Docker Compose is installed and its version
docker compose --version

# running docker compose up; this launches docker containers
# that were defined in the docker-compose.yml file as services
docker compose up -d

# showing a list of all currently running services
# from the docker-compose.yml file
docker-compose ps

# showing a Compose services logs
docker-compose logs

# stopping running services
docker-compose stop

# removing Compose services
docker-compose rm

# this is the equivalent of running the docker compose stop
# and docker compose rm at the same time
docker-compose down
