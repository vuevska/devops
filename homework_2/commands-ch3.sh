# checking that the docker binary works
docker info

# running a container
docker run -i -t ubuntu /bin/bash
# -i keeps STDIN open from the container
# -t this command tells Docker to assign a pesudo-tty 
# to the container we're about to create; this provides
# us with an interactive shell in the new container
# ubuntu is the image used to create a container
# /bin/bash we launch a Bash shell with this command

Commands inside the bash shell for a container:

	# showing the containers hostname
	hostname

	# checking the container's /etc/hosts
	cat /etc/hosts

	# checking the container's interfaces
	hostname -I

	# checking the container's processes
	ps -aux

	# installing a package into a container
	apt-get update; apt-get install vim

# listing docker containers
docker ps -a
# -a all (shows both stopped and running)

# naming a container
docker run --name bob_the_container -i -t ubuntu /bin/bash

# starting a stopped contaienr (by name or by ID)
docker start bob_the_container
docker start aa3f65f0f4e

# starting an interative session to a running container
docker attach bob_the_container
docker attach aa3f65f0f4e

# creating a daemonized container
sudo docker run --name daemon_dave -d ubuntu /bin/bash -c
"while true; do echo hello world; sleep 1; done"

# seeing the logs of a daemonized container
docker logs daemon_dave

# trailing the logs of a daemonized container
docker logs -f daemon_dave

# tailing a portion of the logs of a daemonized container
docker logs --tail 10 daemon_dave

# inspecting the processes of a daemonized container
docker top daemon_dave

# showing statistics for one or more running containers
docker stats daemon_dave demon_dwayne

# running a background task inside a container
docker exec -d daemon_dave touch /etc/new_config_file
# this creates a new empty file /etc/new_config_file
# inside the container

# opening a shell inside a container with exec
docker exec -t -i daemon_dave /bin/bash

# stopping a daemonized container (by name or by ID)
docker stop daemon_dave

# shows the last 2 containers (running or stopped)
docker ps -n 2

# automatic container restarts
docker run --restart=always --name daemon_alice -d ubuntu /bin/sh
-c "while true; do echo hello world; sleep 1; done"

# on failure restart count
--restart=on-failure:5

# inspecting a container
docker inspect daemon_alice

# inspecting the state of a container
docker inspect --format='{{.State.Running}}' daemon_alice

# inspecting the container's IP address
docker inspect --format='{{.NetworkSettings.IPAddress}}' daemon_alice

# inspecting multiple containers
docker inspect --format='{{.Name}} {{.State.Running}}' daemon_dave daemon_alice

# stopping and deleting a container (by name or by ID)
docker stop daemon_alice

# deleting all containers
docker rm -f `sudo docker ps -a -q`
# -a all
# -q returns the container ID's
# -f force remove

