use Mix.Config

config :flowex, host: "api.dialogflow.com"
config :flowex, project_id: "LBot"

config :goth,
  json: "google_credentials.json" |> File.read!
