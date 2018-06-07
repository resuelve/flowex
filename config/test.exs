use Mix.Config

config :flowex, host: "api.dialogflow.com"
config :flowex, project_id: "LBot"
config :flowex, client_email: "client-access@lbot-170198.iam.gserviceaccount.com"

config :goth,
  json: "{\n  \"type\": \"test_service_account\",\n  \"project_id\": "<>
        "\"test_project\",\n  \"private_key_id\": \"0000\",\n  \"private_key\""<>
        ": \"-----BEGIN PRIVATE KEY-----\\ntestPrivateKey\\n-----END PRIVATE KEY-----\\n\""<>
        ",\n  \"client_email\": \"resuelve-bot-api@test_project.test.com\",\n "<>
        " \"client_id\": \"0000\",\n  \"auth_uri\": \"fakeurl\",\n  \"token_uri\":"<>
        " \"fakeurl\",\n  \"auth_provider_x509_cert_url\": \"fakeurl\",\n  "<>
        "\"client_x509_cert_url\": \"fakeurl\"\n}\n"
