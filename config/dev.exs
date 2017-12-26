use Mix.Config

config :flowex, host: System.get_env("DIALOGFLOW_URL")
config :flowex, developer_access_token: System.get_env("DEVELOPER_ACCESS_TOKEN")
config :flowex, protocol_version: System.get_env("PROTOCOL_VERSION")
