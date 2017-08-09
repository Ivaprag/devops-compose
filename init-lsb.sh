case "$1" in
    start)
        echo "Starting Docker Compose" >&2
        echo "Reverse proxy domain name is \"$(hostname -i | cut -d' ' -f1)\"" >&2
        echo "REVERSE_PROXY_DOMAIN_NAME=$(hostname -i | cut -d' ' -f1)" > .env
        docker-compose build
        docker-compose up 
        ;;

    stop)
        echo "Stopping Docker Compose" >&2
        docker-compose stop
        ;;

    restart)
        echo "Restarting Docker Compose" >&2
        docker-compose build
        docker-compose restart
        ;;

    status)
        docker-compose ps
        ;;

    *)
        echo "Usage: $0 {start|stop|restart|status}" >&2
        exit 1
        ;;
esac
