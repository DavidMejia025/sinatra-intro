# Sinatra Blog

## Resumen

Vamos a crear un landing page con un blog. Esta aplicación sera la primera que hagamos con asociaciones y Sinatra.

Vamos a tener dos modelos: `Entry` y `Tag`. Un `Entry` puede tener muchos `Tag`s y un `Tag` puede estar en muchos `Entry`s.

## Pasos


### Paso 0: Controladores y Rutas

Pensando en nuestros controladores podemos asumir que vamos a tener los siguientes 3 archivos.

1. `app/controllers/index.rb`
2. `app/controllers/entries.rb`
3. `app/controllers/tags.rb`

El controlador de `index` solo tiene la ruta para el home. Todas las rutas relacionadas con `Entry` están dentro del controlador para `entries` y todas las relacionadas con `tags` están en el controlador de `tags`.

Estas son las funcionalidades que se mapean muy bien a las rutas que tu app debería tener:

1. Mostrar todos los entries.
2. Mostrar un Entry en particular (por id).
3. Crear un nuevo entry.
4. Editar un entry existente.
5. Borrar un entry existente.
6. Mostrar todos los entries para un `tag`. Como se vería esta URL ? en cual controlador pondrías la ruta ?

Los `Tags` se crean via el formulario para crear un `Entry`.

### Paso 1: Modelos y Validaciones

Crear todos los modelos necesarios para soportar las funcionalidades anteriores. Deberías terminar con 3 modelos cuales son ?

Agrega las validaciones apropiadas a tus modelos.

Por ejemplo, si un `Entry` tiene `body` y `title`, seguramente no querrás permitir que se guarden `Entry`s con estos campos vacíos. Esto significaría las siguientes validaciones:

```ruby
class Entry < ActiveRecord::Base
  validates :body, :presence => true
  validates :title, :presence => true
end
```

Seguramente vas a tener mas campos y validaciones para este modelo. Por ejemplo Autor ?

### Paso 2: Paginas y Formularios

Diseña el Markup para las paginas que soporten las funcionalidades anteriores. No importa que el estilo no sea muy bueno.

Crea los formularios para crear y actualizar instancias de `Entry`. Estos formularios deberían dejar agregarle tags al entry.  En ejemplo de como se podría ver esto seria el siguiente:

```html
<label for="entry_tags">Tags:</label>
<input id="entry_tags" name="entry[tags]" value="tag1, tag2, some other tag, a fourth tag">
```

Deberías poder listar, mostrar, crear, actualizar y borrar entries. También deberías poder ver todos los entries para determinado tag.


Ejemplo: Que muestra esta ruta ??
```text
http://localhost:9393/tags/apple
```

### Paso 3: Maneja Errores

Usando las validaciones y los métodos de errores, asegurate de manejar estos de forma elegante. No tiene que ser perfecto pero por lo menos deberías poder:

1. Cuando un usuario crea un error, se les informa.
2. El usuario tiene la oportunidad de solucionar su error.
3. Se le da al usuario toda la información posible y guía sobre como arreglar su error

### Paso 4: Estilos!

Haz que se vea bonito (◕ω◕✿)

## Recursos

* [Active Record validations][AR validations]
* [Active Record valid? and invalid?][valid_invalid]
* [Active Record errors][errors]


[AR validations]: http://guides.rubyonrails.org/active_record_callbacks.html
[valid_invalid]: http://guides.rubyonrails.org/active_record_validations.html#valid-questionmark-and-invalid-questionmark
[errors]: http://guides.rubyonrails.org/active_record_validations.html#working-with-validation-errors
