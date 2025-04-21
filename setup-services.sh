#!/bin/bash

source bin/setup.sh

help() {
    echo "Command: setup-services.sh"
    echo "Usage:"
    echo "./setup-services.sh start"
    echo "Generic:"
    echo "./setup-services.sh <operation>"
    echo "Operations:"
    echo "- start"
    echo "- stop"
    echo "- reset"
    echo "- clean"

    # Add the EOT token to the end of the help message
    echo -e "\x04"
}

welcome() {
    echo ""
    echo "🚀 This script sets up core infrastructure services. It will deploy the following components:"
    echo "  * Gitea     - Git service for version control and project management."
    echo "  * Authelia  - Authentication and authorization server for secure access control."
    echo "  * Grafana   - Visualization platform for monitoring metrics and logs."
    echo "  * PostgreSQL- Relational database to store application metadata."
    echo "  * Loki      - Log aggregation system for collecting and querying logs."
    echo "  * Promtail  - Log shipping agent that sends logs to Loki."
    echo ""
}

operation=${@: -1}

if [ "$#" -lt 1 ]; then
    help
    exit 1
fi

welcome

setup_docker_and_compose

services="postgres gitea grafana authelia nginx loki promtail"
file="./docker/a-docker-compose.yml"

if [ "$operation" == "start" ] || [ "$operation" == "stop" ] || [ "$operation" == "restart" ] || [ "$operation" == "clean" ]; then
    echo "🔧 Performing operation ${@: -1} in environment"
else
    echo "❌ ERROR: Operation type provided is not supported. Exiting..."
    help
    exit 1
fi


case "$operation" in
    start)
        echo "🚀 Starting docker containers..."
        docker-compose  --file $file up --no-deps -d $services
        ;;
    stop)
        echo "⏹️ Stopping docker containers..."
        docker-compose  --file $file down
        ;;
    restart)
        echo "🔄 Restarting docker containers..."
        docker-compose  --file $file down
        echo
        docker-compose  --file $file up --no-deps -d $services
        ;;
    clean)
        echo "🧹 Cleaning docker containers and volumes..."
        docker-compose  --file $file down -v
        ;;
    *)
        help
        exit 1
        ;;
    esac