use Mix.Config

config :flowex, host: System.get_env("DIALOGFLOW_URL")
config :flowex, project_id: System.get_env("DIALOGFLOW_PROJECT_ID")
config :flowex, client_email: System.get_env("CLIENT_EMAIL")

config :goth,
  json: System.get_env("GOOGLE_CREDENTIALS") |> File.read!
