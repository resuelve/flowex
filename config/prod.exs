import Config

config :flowex, host: "${DIALOGFLOW_URL}"
config :flowex, project_info: "${PROJECTS_INFO}" |> Base.decode64!()

config :goth, json: "${GOOGLE_CREDENTIALS}" |> Base.decode64!()
