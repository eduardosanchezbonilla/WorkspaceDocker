import time
from locust import HttpUser, task, between


class QuickstartUser(HttpUser):
    wait_time = between(1, 2)

    @task
    def hello_world(self):
        self.client.get("/catastro/byLocation?latitud=28.109625&longitud=-15.431524&metadata.maxResults=4&metadata.minReliability=0.9&metadata.showAggregateResults=true")
        self.client.get("/catastro/byAll?metadata.showTraceRoute=true&metadata.showQueries=true&metadata.showFinalQuery=true&metadata.showAggregateResults=true&nombreprovincia=MADRID&nombremunicipio=MADRID&codigopostal=28055&nombretipoviareducido=CL&nombrevia=MANUEL%20GUTIERREZ%20MELLADO&numero=47&escalera=3&planta=03&puerta=B&direccioncompleta=CALLE%20MANUEL%20GUTIERREZ%20MELLADO%2047&restodireccion=3%20B")
        self.client.get("/catastro/byAll?metadata.showAggregateResults=true&codigoprovinciaine=21&codigomunicipioine=41&codigopostal=21007&nombretipovia=CL&nombrevia=RIO%20DUERO&numeroycomplemento=6")
        self.client.get("/catastro/byAddress?metadata.maxResults=1&metadata.minReliability=0&metadata.showAggregateResults=true&codigoprovinciaine=47&codigopostal=47012&nombremunicipio=VALLADOLID&nombrevia=ARRIBES+DEL+DUERO&nombretipovia=CALLE")
        self.client.get("/catastro/byAddress?metadata.maxResults=1&metadata.minReliability=0&metadata.showAggregateResults=true&nombreprovincia=COLMENAR+VIEJO++++++++++++++&codigopostal=28770&nombremunicipio=MADRID++++++++++++++&nombrevia=DE+LA+ESTACION+DE+CHAMARTIN+++++++++")
        self.client.get("/catastro/byLocation?latitud=28.108692&longitud=-15.435988&metadata.maxResults=1&metadata.minReliability=0.9&metadata.showAggregateResults=true")
        self.client.get("/catastro/byLocation?latitud=36.593197&longitud=-4.573996&metadata.maxResults=1&metadata.minReliability=0.9&metadata.showAggregateResults=true")
        self.client.get("/legacy/catastro/buscador/espacio/agregado/resto?tipovia=C&numero=4&municipio=SEGORBE&nombrevia=HIGUERAS&provincia=12&resto=1++++2++2&codigopostal=12400")
        self.client.get("/legacy/catastro/buscador/espacio/agregado/resto?tipovia=C&numero=6&municipio=GRANADA&nombrevia=MARTINEZ+DE+LA+ROSA&provincia=18&resto=2+CT&codigopostal=18002")
        
