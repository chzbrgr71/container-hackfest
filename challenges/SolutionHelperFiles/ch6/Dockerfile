FROM postgres:9.4
ENTRYPOINT []
CMD export POSTGRES_PASSWORD=$(cat /etc/secrets/password); export POSTGRES_USER=$(cat /etc/secrets/username); /docker-entrypoint.sh postgres