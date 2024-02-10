#!/bin/sh
echo 'INICIO'
echo '----------------------------------------'
echo 'Paramos Jenkins'
docker-compose -f Jenkins/docker-compose.yml stop
echo '----------------------------------------'
echo 'Paramos Sonar'
docker-compose -f SonarQube/docker-compose.yml stop
echo '----------------------------------------'
echo 'Paramos Nexus'
docker-compose -f Nexus/docker-compose.yml stop
echo '----------------------------------------'
echo 'Paramos Gitlab'
docker-compose -f Gitlab/docker-compose.yml stop
echo '----------------------------------------'
echo 'FIN'
