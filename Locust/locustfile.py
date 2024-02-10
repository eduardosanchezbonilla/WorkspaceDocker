import time
from locust import HttpUser, task, between


class QuickstartUser(HttpUser):
    wait_time = between(1, 2)

    @task
    def hello_world(self):
    	# para serviciios en localhost usar la ip 192.168.0.24 (ip addr show)
        self.client.get("/normalizar/direccion?texto=calle deportes 18 martos jaen")   # 200
        self.client.get("/normalizar/direccion?texto=kkkkkkkkkkkkkkkkkkkkkkkkkkk")   # 204 , para locust es correcto
        self.client.get("/normalizar/direccion?texto=avenida de la alhambra con una prueba que tarde bastante y no devuelva nada")   # 204 , para locust es correcto
        self.client.get("/normalizar/direccion?texto=calle real")   # 200
        #self.client.get("/normalizar/direccion?texto=k")   # 204 , para locust es fail
