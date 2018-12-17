use Mix.Config

config :flowex, host: "${DIALOGFLOW_URL}"
config :flowex, project_info: "${PROJECTS_INFO}"

config :goth, json: "${GOOGLE_CREDENTIALS}" |> File.read!
