defmodule Flowex.Service.IntentsTest do
  use ExUnit.Case

  import Mock

  alias Flowex.Service.Intents
  alias Goth.Token

  @intents %{
   "intents" => [
     %{
       "displayName" => "Acción (Despedida)",
       "messages" => [%{"text" => %{"text" => ["Bye", "Nos vemos"]}}],
       "name" => "projects/lbot-170189/agent/intents/4cff39af-ba13-4a62-ba6f-8a79f4f5b324",
       "priority" => 500000
     }
   ]
 }

  @intent %{
    "displayName" => "Acción (Despedida)",
    "messages" => [%{"text" => %{"text" => ["Bye", "Nos vemos"]}}],
    "name" => "projects/lbot-170189/agent/intents/4cff39af-ba13-4a62-ba6f-8a79f4f5b324",
    "priority" => 500000
  }

  @intent_view_full %{
    "displayName" => "Información Personal - En que ando",
    "messages" => [
      %{
        "text" => %{
          "text" => [
            "Aquí no más", "Esperando a que preguntes algo", "Trabajando ¿y tú?"
          ]
        }
      }
    ],
    "name" => "projects/lbot-170189/agent/intents/32d433a0-6542-4cbe-acc9-8e4af253cc26",
    "priority" => 500_000,
    "trainingPhrases" => [
      %{
        "name" => "cecaf1ee-c5b3-456c-8ff5-7c17eeb33acb",
        "parts" => [%{"text" => "Qué onda, Coyote, qué cuentas o qué"}],
        "type" => "EXAMPLE"
      },
      %{
        "name" => "661e0ded-7817-47f8-ab87-09ef4f548115",
        "parts" => [%{"text" => "¿Qué haces?"}],
        "type" => "EXAMPLE"
      }
    ]
  }

  test "list list all intents" do
    with_mocks([
      {
        Token,
        [:passthrough],
        [for_scope: fn(_url) -> {:ok, %{token: "0xFAKETOKEN_Q="}} end]
      },
      {
        HTTPoison,
        [:passthrough],
        [request: fn(_method, _url, _params, _headers) ->
          body = Poison.encode!(@intents)
          {:ok, %HTTPoison.Response{status_code: 200, body: body}}
        end]
      }
    ]) do
      assert Intents.list == {:ok, @intents["intents"]}
    end
  end

  test "get/3 get an intent by id" do
    with_mocks([
      {
        Token,
        [:passthrough],
        [for_scope: fn(_url) -> {:ok, %{token: "0xFAKETOKEN_Q="}} end]
      },
      {
        HTTPoison,
        [:passthrough],
        [request: fn(_method, _url, _params, _headers) ->
          body = Poison.encode!(@intent)
          {:ok, %HTTPoison.Response{status_code: 200, body: body}}
        end]
      }
    ]) do
      assert Intents.get("5eec5344-8a09-40ba-8f46-1d2ed3f7b0df") == {:ok, @intent}
    end
  end

  test "update/3 update an intent view full" do
    with_mocks([
      {
        Token,
        [:passthrough],
        [for_scope: fn(_url) -> {:ok, %{token: "0xFAKETOKEN_Q="}} end]
      },
      {
        HTTPoison,
        [:passthrough],
        [request: fn(_method, _url, _params, _headers) ->
          body = Poison.encode!(@intent_view_full)
          {:ok, %HTTPoison.Response{status_code: 200, body: body}}
        end]
      }
    ]) do
      assert Intents.update("5eec5344-8a09-40ba-8f46-1d2ed3f7b0df",
                                  @intent_view_full) == {:ok, @intent_view_full}
    end
  end
end
