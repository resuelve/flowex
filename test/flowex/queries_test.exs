defmodule Flowex.Api.QueriesTest do
  use ExUnit.Case

  import Mock

  alias Flowex
  alias Flowex.Api.Queries

  @query %{
    "id" => "2cbddea2-ec61-4b59-89ba-336450635a1f",
    "lang" => "es",
    "result" => %{
      "action" => "input.unknown",
      "actionIncomplete" => false,
      "contexts" => [%{
        "lifespan" => 4,
        "name" => "shop",
        "parameters" => %{}
      }],
      "fulfillment" => %{
        "messages" => [%{
          "speech" => "¿Cómo?",
          "type" => 0
        }],
        "speech" => "¿Podrías repetirlo, por favor?"
      },
      "metadata" => %{
        "intentId" => "b5a8456c-3538-4666-a2a8-6fac02275d67",
        "intentName" => "Default Fallback Intent",
        "webhookForSlotFillingUsed" => "false",
        "webhookUsed" => "false"
      },
      "parameters" => %{},
      "resolvedQuery" => "I need apples",
      "score" => 1.0,
      "source" => "agent"
    },
    "sessionId" => "12345",
    "status" => %{
      "code" => 200,
      "errorType" => "success",
      "webhookTimedOut" => false
    },
    "timestamp" => "2017-12-22T00:32:28.982Z"
  }

  test "query/5 get intent by id" do
    with_mock Flowex, [request: fn(_method, _path, _body) -> {:ok, @query} end] do
      assert Queries.query(["shop"], "en", "I need apples", "12345", "America/Mexico_City") == {:ok, @query}
    end
  end

end
