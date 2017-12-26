defmodule Flowex.Api.IntentsTest do
  use ExUnit.Case

  import Mock

  alias Flowex.Api.Intents
  alias Flowex

  @intents [
    %{
      "actions" => ["input.welcome"],
      "contextIn" => [],
      "contextOut" => [],
      "events" => [%{"name" => "WELCOME"}],
      "fallbackIntent" => false,
      "id" => "08dd8477-474c-4959-a5fa-37695ae40d1d",
      "name" => "Default Welcome Intent",
      "parameters" => [],
      "priority" => 500000
    },
    %{
      "actions" => ["input.unknown"],
      "contextIn" => [],
      "contextOut" => [],
      "events" => [],
      "fallbackIntent" => true,
      "id" => "b5a8456c-3538-4666-a2a8-6fac02275d67",
      "name" => "Default Fallback Intent",
      "parameters" => [],
      "priority" => 500000
    }
  ]

  @not_found_intent %{
    "id" => "63f63763-c115-47c0-9d11-dc655720d2f0",
    "lang" => "en",
    "status" => %{
      "code" => 400,
      "errorDetails" => "Unknown error errorid=fb64bff8-0bbf-41d6-a309-90465d59d862",
      "errorType" => "bad_request",
      "webhookTimedOut" => false
    },
    "timestamp" => "2017-12-22T00:10:44.962Z"
  }

  @intent %{
    "auto" => true,
    "contexts" => [],
    "events" => [%{"name" => "WELCOME"}],
    "fallbackIntent" => false,
    "followUpIntents" => [],
    "id" => "08dd8477-474c-4959-a5fa-37695ae40d1d",
    "name" => "Default Welcome Intent",
    "priority" => 500000,
    "responses" => [%{
      "action" => "input.welcome",
      "affectedContexts" => [],
      "defaultResponsePlatforms" => %{},
      "messages" => [%{
        "speech" => ["¡Hola!", "¡Hey!", "¡Buenos días!"],
        "type" => 0
      }],
      "parameters" => [],
      "resetContexts" => false,
      "speech" => []
    }],
    "templates" => [],
    "userSays" => [],
    "webhookForSlotFilling" => false,
    "webhookUsed" => false
  }

  @create_intent_attrs %{
    contexts: ["ventas"],
    events: [],
    fallbackIntent: false,
    name: "new-intent",
    priority: 500000
  }

  @success_intent %{
    "id" => "4cbf7e66-460c-46e0-ab71-a682cc71c5d2",
    "status" => %{
      "code" => 200,
      "errorType" => "success"
    }
  }

  test "list/1 list all intents" do
    with_mock Flowex, [request: fn(_method, _path, _body) -> {:ok, @intents} end] do
      assert Intents.list == {:ok, @intents}
    end
  end

  test "get/1 get intent by id" do
    with_mock Flowex, [request: fn(_method, _path, _body) -> {:ok, @intent} end] do
      assert Intents.get("08dd8477-474c-4959-a5fa-37695ae40d1d") == {:ok, @intent}
    end
  end

  test "get/1 intent not found looking for id" do
    with_mock Flowex, [request: fn(_method, _path, _body) -> {:error, @not_found_intent} end] do
      assert Intents.get("1") == {:error, @not_found_intent}
    end
  end

  test "create/1 Create intent" do
    with_mock Flowex, [request: fn(_method, _path, _body) -> {:ok, @success_intent} end] do
      assert Intents.create(@create_intent_attrs) == {:ok, @success_intent}
    end
  end

end
