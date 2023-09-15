# Instructivo de ejecuión Sistema Bancario #

## SistemaBancario ##

| **Área**     | Proceso Satrack |
| ------------ | ------------------------------------------- |
| **Contacto** | Edison Alberto García Aguirre edisongarcia3797@gmail.com|


#### Tabla de contenido

- [Descripción de la necesidad](#descripción-de-la-necesidad)
- [Consumo de Métodos](#consumo-de-métodos)


#### Descripción de la necesidad

Esta integración cumple con el requerimiento de exponer en un servicio la acumulación de Puntos Colombia..

| **Nombre de la interfaz:** | **ConsultaCliente**                            |
| -------------------------- | ------------------------------------------------------------ |
| **Qué**                    | Se requiere obtener y enviar los datos de acumulación.|
| **Porqué**                 | Se requiere enviar dichos datos para la acumulación a Puntos Colombia y/o Clifre.|
| **Para que**               | Para proporcionar los datos de acumulacióna una cola de RabbitMQ.|

#### Consumo de métodos
- Mensaje de solicitud del servicio
 
