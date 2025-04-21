#!/bin/bash
setup_docker_and_compose() {
    if ! command -v docker &>/dev/null; then
        echo "Installing Docker..."
        curl -fsSL https://get.docker.com -o get-docker.sh
        sudo sh get-docker.sh

        sudo usermod -aG docker $USER
        sudo newgrp docker

        # Installing docker-compose
        DOCKER_COMPOSE_VERSION="1.29.2"
        sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose

        echo "✔️ Docker installed."
    fi

    echo "🐳 Docker version:"
    docker --version | awk '{print "\t"$0}'

    echo "🐳 docker-compose version:"
    docker-compose --version | awk '{print "\t"$0}'
}