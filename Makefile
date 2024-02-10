COLOR_RESET   = \033[0m
COLOR_INFO    = \033[32m
COLOR_COMMENT = \033[33m

.DEFAULT_GOAL:=help

###############
##@ HELPERS 
###############
.PHONY: help

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[1;34m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[1;34m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)


#############
##@ START CONTAINERS
#############
##@   Gestion de contenedores 
.PHONY: start-portainer
start-portainer: ## Arranca el container de Portainer
	docker-compose -f Portainer/docker-compose.yml up -d

##@   Herramientas CI 
.PHONY: start-ci
start-ci: start-jenkins start-sonar start-nexus start-gitlab ## Arranca todos los contenedores asociados a CI

.PHONY: start-jenkins
start-jenkins: ## Arranca el container de Jenkins
	docker-compose -f Jenkins/docker-compose.yml up -d
	
.PHONY: start-sonar
start-sonar: ## Arranca el container de Sonar
	docker-compose -f SonarQube/docker-compose.yml up -d	
	
.PHONY: start-nexus
start-nexus: ## Arranca el container de Nexus
	docker-compose -f Nexus/docker-compose.yml up -d		
	
.PHONY: start-grafana
start-grafana: ## Arranca el container de Grafana
	docker-compose -f Grafana/docker-compose.yml up -d			
	
.PHONY: start-elk
start-elk: ## Arranca el container de Elk
	docker-compose -f Elk/docker-compose.yml up -d				

.PHONY: start-keycloak
start-keycloak: ## Arranca el container de Keycloak
	docker-compose -f Keycloak/docker-compose.yml up -d		

.PHONY: start-openldap
start-openldap: ## Arranca el container de Openldap
	docker-compose -f Openldap/docker-compose.yml up -d		

##@   Bases de datos 
.PHONY: redis
start-redis: ## Arranca el container de Redis
	docker-compose -f Redis/docker-compose.yml up -d		
	
.PHONY: postgres
start-postgres: ## Arranca el container de Postgres
	docker-compose -f Postgres/docker-compose.yml up -d	

.PHONY: oracle
start-oracle: ## Arranca el container de Oracle 19
	docker-compose -f Oracle/docker-compose.yml up -d	
	
PHONY: mysql
start-mysql: ## Arranca el container de MySql
	docker-compose -f MySql/docker-compose.yml up -d --remove-orphans	
		
.PHONY: mongo
start-mongo: ## Arranca el container de Mongo
	docker-compose -f Mongo/docker-compose.yml up -d --remove-orphans

##@   Pruebas de rendimiento
.PHONY: start-locust
start-locust: ## Arranca el container de Locust
	docker-compose -f Locust/docker-compose.yml up -d
	
.PHONY: start-jmeter
start-jmeter: ## Arranca el container de Jmeter
	sh ./Jmeter/apache-jmeter-5.2.1/bin/jmeter

##@   Desarrollo Python 
.PHONY: start-jupyter
start-jupyter: ## Arranca el container de Anaconda Jupyter
	docker-compose -f AnacondaJupyter/docker-compose.yml up -d --build		
	
##@   Address analize 	
.PHONY: start-libpostal
start-libpostal: ## Arranca el container de LibPostal
	docker-compose -f LibPostal/docker-compose.yml up -d --build	
	
.PHONY: start-pelias
start-pelias: ## Arranca el container de Pelias
	docker-compose -f Pelias/docker-compose.yml up -d 

	
############	
##@ STOP CONTAINERS
############
##@   Masivos
.PHONY: stop-all
stop-all: stop-jenkins stop-sonar stop-nexus stop-grafana stop-keycloak stop-openldap stop-redis stop-postgres stop-oracle stop-mongo stop-mysql stop-jupyter stop-libpostal stop-pelias ## Detiene todos los contenedores existentes salvo portainer
	
##@   Gestion de contenedores 
.PHONY: stop-portainer
stop-portainer: ## Detiene el container de Portainer
	docker-compose -f Portainer/docker-compose.yml stop

##@   Herramientas CI 
.PHONY: stop-ci
stop-ci: stop-jenkins stop-sonar stop-nexus stop-gitlab ## Detiene todos los contenedores asociados a CI

.PHONY: stop-jenkins
stop-jenkins: ## Detiene el container de Jenkins
	docker-compose -f Jenkins/docker-compose.yml stop
	
.PHONY: stop-sonar
stop-sonar: ## Detiene el container de Sonar
	docker-compose -f SonarQube/docker-compose.yml stop	
	
.PHONY: stop-nexus
stop-nexus: ## Detiene el container de Nexus
	docker-compose -f Nexus/docker-compose.yml stop		
		
.PHONY: stop-grafana
stop-grafana: ## Detiene el container de Grafana
	docker-compose -f Grafana/docker-compose.yml stop	

.PHONY: stop-keycloak
stop-keycloak: ## Detiene el container de Keycloak
	docker-compose -f Keycloak/docker-compose.yml stop	
	
.PHONY: stop-openldap
stop-openldap: ## Detiene el container de Openldap
	docker-compose -f Openldap/docker-compose.yml stop		
	
##@   Bases de datos 
.PHONY: redis
stop-redis: ## Detiene el container de Redis
	docker-compose -f Redis/docker-compose.yml stop		
	
.PHONY: postgres
stop-postgres: ## Detiene el container de Postgres
	docker-compose -f Postgres/docker-compose.yml stop	

.PHONY: oracle
stop-oracle: ## Detiene el container de Oracle 19
	docker-compose -f Oracle/docker-compose.yml stop	

.PHONY: mysql
stop-mysql: ## Detiene el container de MySql
	docker-compose -f MySql/docker-compose.yml stop	
		
.PHONY: mongo
stop-mongo: ## Detiene el container de Mongo
	docker-compose -f Mongo/docker-compose.yml stop
	
##@   Pruebas de rendimiento
.PHONY: stop-locust
stop-locust: ## Detiene el container de Locust
	docker-compose -f Locust/docker-compose.yml stop

.PHONY: stop-jmeter
stop-jmeter: ## Detiene el container de JMeter
	docker-compose -f Jmeter/docker-compose.yml stop
			
##@   Desarrollo Python 	
.PHONY: stop-jupyter
stop-jupyter: ## Detiene el container de Anaconda Jupyter
	docker-compose -f AnacondaJupyter/docker-compose.yml stop
	
##@   Address analize 		
.PHONY: stop-libpostal
stop-libpostal: ## Detiene el container de LibPostal
	docker-compose -f LibPostal/docker-compose.yml stop	
	
.PHONY: stop-pelias
stop-pelias: ## Detiene el container de Pelias
	docker-compose -f Pelias/docker-compose.yml stop		
