defmodule FlowexTest do
  use ExUnit.Case
  doctest Flowex

  import Mock

  @response %HTTPoison.Response{status_code: 200, body: "{\"status\":\"success\"}"}

  test "request/3 helper for request to Dialogflow" do
    with_mock HTTPoison, [request: fn(_method, url, _body, _headers, _options) -> {:ok, @response} end] do
      assert Flowex.request(:get, "intents", "") == {:ok, %{"status" => "success"}}
    end
  end

end
