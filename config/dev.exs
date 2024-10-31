import Config

config :flowex, host: System.get_env("DIALOGFLOW_URL")
config :flowex, projects_info: System.get_env("PROJECTS_INFO") |> Base.decode64!()

config :goth, json: System.get_env("GOOGLE_CREDENTIALS") |> Base.decode64!()
