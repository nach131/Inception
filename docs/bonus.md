

 **Redis:**
   Un sistema de almacenamiento en caché y almacenamiento de estructuras de datos en memoria. Útil para mejorar el rendimiento de las aplicaciones.

   ```yaml
   services:
     redis:
       image: redis:latest
       ports:
         - "6379:6379"
   ```



 **Prometheus y Grafana:**
   Herramientas de monitoreo y visualización que se utilizan para observabilidad en sistemas.

   ```yaml
   services:
     prometheus:
       image: prom/prometheus:latest
       ports:
         - "9090:9090"

     grafana:
       image: grafana/grafana:latest
       ports:
         - "3000:3000"
   ```
