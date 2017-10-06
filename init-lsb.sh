function setProxyDomainName {
        REVERSE_PROXY_DOMAIN_NAME=`hostname -i | cut -d' ' -f1`
	export REVERSE_PROXY_DOMAIN_NAME=$REVERSE_PROXY_DOMAIN_NAME
        echo "Reverse proxy domain name is \"$REVERSE_PROXY_DOMAIN_NAME\"" >&2
}

function setPassword {
	read -s -p "Enter your password: " PASS
	export PASS=$PASS
}

function updateDBConfigFile {
        sed -i -e "s/#PASS#/'"$PASS"'/g" ./postgres/create-database.sql
}

function resetDBConfigFile {
        sed -i -e "s/'"$PASS"'/#PASS#/g" ./postgres/create-database.sql
}

case "$1" in
    start)
        echo "Starting Docker Compose" >&2
	setProxyDomainName
	setPassword
        updateDBConfigFile

        docker-compose build
        docker-compose up -d 

        resetDBConfigFile
        ;;

    stop)
        echo "Stopping Docker Compose" >&2
        docker-compose stop
        ;;

    restart)
        echo "Restarting Docker Compose" >&2
        docker-compose restart -d
        ;;

    status)
        docker-compose ps
        ;;

    up)
	echo "Restarting service $2" >&2
	setProxyDomainName
	docker-compose up -d $2
	;;
    *)
	    echo "Usage: $0 {start|stop|restart|status|up [SERVICE] }" >&2
        exit 1
        ;;
esac
