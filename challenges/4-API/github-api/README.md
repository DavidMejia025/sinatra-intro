  # Consume an API

## Competencias de aprendizaje
- consumir una API, de forma limpia, modular y extendible.

## Resumen

Vas a construir una aplicación que consuma algunos endpoints de la [Api de Github](https://developer.github.com/v3/).

## Pasos

### Paso 0: Descubriendo la interfaz

Cuando trabajas con una API, el paso mas importante es que descubras exactamente como lo que esa API de provee. A menudo, las APIs dan menos funcionalidad o requieren de mas configuración de lo que uno esperaba. Antes de empezar a trabajar en este reto descubre como funciona la API de Github.

En particular, empieza leyendo esta documentación:
[repos](https://developer.github.com/v3/repos/)
[users](https://developer.github.com/v3/users/)

Mientras lees esto hazte las siguientes preguntas:

1. Cuales son las capacidades de la API.
2. Usa cURL o HTTParty para probar los endpoints. Esto te ayuda a ver lo que la api hace y cual es su respuesta.
3. **Presta especial atención a los esquemas de autenticación**. Seguramente van a ser tu principal bloqueo a resolver.
  - Que endpoints requieren de autenticación?
  - Que pasa si el endpoint require de autenticación pero tu no estas autenticado.
  - Como autenticas tus request a la API.

4. Adapta la API a tus necesidades.

Decide que quieres construir con esta información.
