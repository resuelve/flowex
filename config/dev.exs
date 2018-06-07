use Mix.Config

config :flowex, host: System.get_env("DIALOGFLOW_URL")
config :flowex, project_id: System.get_env("DIALOGFLOW_PROJECT_ID")

config :goth,
  json: System.get_env("DIALOGFLOW_CREDENTIALS") |> File.read!
