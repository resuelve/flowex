# Flowex

Cliente de Elixir para el Dialogflow API v2.

## Instalación

Primero, agrega Flowex a su tus dependencias en mix.exs:

```elixir
def deps do
  [
    {:flowex, "~> 1.0.0"}
  ]
end
```

### Configurar variables de entorno.

El archivo __.env.dist__ contiene un listado actualizado de las variables de entorno necesarias para el proyecto, se debe copiar ese archivo a uno nuevo llamado __.env__

Tambien necesitaras crear un archivo llamando google_credentials.json dentro de la carpeta secrets.

Preguntar al equipo por los valores de las variables de entorno.

Exporta las variables

```shell
export $(cat .env | xargs)
```

## Como contribuir.

Pasos para contribuir en el proyecto:

- Hacer un __fork__ del repositorio a nuestra cuenta privada de Github.
- Clonar nuestro __fork__ en nuestra maquina de trabajo.
- Crear un remote llamado upstream que apunte hacia el repo de Resuelve.

```shell
git remote add upstream git@github.com:resuelve/flowex.git
```

- Lee las [guías de desarrollo.](https://github.com/resuelve/guias-desarrollo)

## Instalar dependencias

```shell
mix deps.get
```
## Uso

### Flowex.Service.Agent

Obtiene el agente al que está asociado el project_id. [(📘)](https://dialogflow.com/docs/reference/api-v2/rest/v2/projects/getAgent)

```elixir
get()
```

### Flowex.Service.Intents

Lista los de intents de un agente. [(📘)](https://dialogflow.com/docs/reference/api-v2/rest/v2/projects.agent.intents/list)

```elixir
list(language \\ "es", view \\ "INTENT_VIEW_UNSPECIFIED", pageSize \\ 100, token \\ nil)
```

Obtiene un intent buscando por id. [(📘)](https://dialogflow.com/docs/reference/api-v2/rest/v2/projects.agent.intents/get)

```elixir
get(id, languageCode \\ "es", intentView \\ "INTENT_VIEW_UNSPECIFIED")
```

Añade un frase de entrenamiento a un intent. [(📘)](https://dialogflow.com/docs/reference/api-v2/rest/v2/projects.agent.intents/patch)

```elixir
add_training_phrase(id, language \\ "es", text)
```

### Flowex.Service.Sessions

Procesa una consulta en lenguaje natural para detectar un intent con la respuesta apropiada [(📘)](https://dialogflow.com/docs/reference/api-v2/rest/v2/projects.agent.sessions/detectIntent)

```elixir
get()
```
