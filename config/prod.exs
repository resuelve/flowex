use Mix.Config

config :flowex, host: "${DIALOGFLOW_URL}"
config :flowex, project_id: "${DIALOGFLOW_PROJECT_ID}"

config :goth,
  json: "${DIALOGFLOW_CREDENTIALS}" |> File.read!
