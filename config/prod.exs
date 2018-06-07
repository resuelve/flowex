use Mix.Config

config :flowex, host: "${DIALOGFLOW_URL}"
config :flowex, project_id: "${DIALOGFLOW_PROJECT_ID}"
config :flowex, client_email: "${CLIENT_EMAIL}"

config :goth,
  json: "${GOOGLE_CREDENTIALS}" |> File.read!
