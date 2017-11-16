# Sinatra Autenticación y Autorización

## Resumen

Usando Sinatra, vas a crear un app que posibilite hacer `login/signup` y que autentique a un usuario antes de mostrarle información. Para este reto ya te damos un esqueleto que tiene código para la base de datos, las vistas y los controladores.

## Pasos

### Paso 0: Implementa el login/signup

Modifica el esqueleto para lograr la siguiente funcionalidad:

1. Un usuario puede crear una nueva cuenta `signup` con un email y un password.
2. Un usuario existente puede hacer login
3. Si un usuario no esta logueado, solo pueden ver un mensaje de bienvenida.
4. Si un usuario esta logueado, pueden ver todos los usuario registrados en la pagina.
5. Un usuario puede hacer `logout` usando la ruta de `delete` que es un campo oculto de un formulario.
6. Existe un método `helper` `current_user` que devuelve el usuario actualmente logueado, y se usa para para mostrar los elementos apropiados en las vistas. Esta lógica ya esta implementada pero tienes que acabar de hacer el método helper.


### Paso 1: Encryption

Guardar passwords es un asunto serio. Siempre debes tomar los pasos necesarios para mantener la información segura. Los password deben encryptarse y guardarse en un campo llamado `password_hash` usa la gema `bcrypt` para lograr esto.

### Paso 2: Validaciones (opcional)

Agrega validaciones para:

* longitud del password
* muestra los errores apropiados
