use Mix.Config

config :flowex, host: System.get_env("DIALOGFLOW_URL")
config :flowex, projects_info: System.get_env("PROJECTS_INFO") |> File.read!

config :goth, json: System.get_env("GOOGLE_CREDENTIALS") |> File.read!
