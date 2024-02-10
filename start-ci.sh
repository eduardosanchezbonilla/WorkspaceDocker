#!/bin/sh
echo 'INICIO'
echo '----------------------------------------'
echo 'Arrancamos Jenkins'
docker-compose -f Jenkins/docker-compose.yml up -d
echo '----------------------------------------'
echo 'Arrancamos Sonar'
docker-compose -f SonarQube/docker-compose.yml up -d
echo '----------------------------------------'
echo 'Arrancamos Nexus'
docker-compose -f Nexus/docker-compose.yml up -d
echo '----------------------------------------'
echo 'Arrancamos Gitlab'
docker-compose -f Gitlab/docker-compose.yml up -d
echo '----------------------------------------'
echo 'FIN'
