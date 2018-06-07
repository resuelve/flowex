defmodule Flowex.Service.IntentsTest do
  use ExUnit.Case

  import Mock

  alias Flowex.Service.Intents
  alias Goth.Token

  @intents %{
   "intents" => [
     %{
       "action" => "input.welcome",
       "displayName" => "Default Welcome Intent",
       "events" => ["WELCOME"],
       "messages" => [
         %{"text" => %{"text" => ["¡Hola!", "¡Hey!", "¡Buenos días!"]}}
       ],
       "name" => "projects/lbot-170189/agent/intents/225726d5-94ec-481b-b8ef-d7360e9dfc38",
       "priority" => 500000
     },
     %{
       "action" => "input.unknown",
       "displayName" => "Default Fallback Intent",
       "isFallback" => true,
       "messages" => [
         %{
           "text" => %{
             "text" => ["Ups, no he entendido a que te refieres.",
              "¿Podrías repetirlo, por favor?", "¿Disculpa?", "¿Decías?",
              "¿Cómo?"]
           }
         }
       ],
       "name" => "projects/lbot-170189/agent/intents/5eec5344-8a09-40ba-8f46-1d2ed3f7b0df",
       "priority" => 500000
     }
   ]
 }

  @intent %{
    "action" => "input.unknown",
    "displayName" => "Default Fallback Intent",
    "isFallback" => true,
    "messages" => [
      %{
        "text" => %{
          "text" => [
            "Ups, no he entendido a que te refieres.",
            "¿Podrías repetirlo, por favor?", "¿Disculpa?",
            "¿Decías?", "¿Cómo?"
          ]
        }
      }
    ],
    "name" => "projects/lbot-170189/agent/intents/5eec5344-8a09-40ba-8f46-1d2ed3f7b0df",
    "priority" => 500000
  }

  test "list/0 list all intents" do
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
      assert Intents.list == {:ok, @intents}
    end
  end

  test "get/1 get an intent by id" do
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

end
