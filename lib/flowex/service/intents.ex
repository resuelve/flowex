defmodule Flowex.Service.Intents do
  @moduledoc """
  Helper para intents.
  """

  alias Flowex

  @doc """
  Lista los de intents de un agente.
  """
  @spec list(String.t, String.t, integer, String.t | nil) :: tuple
  def list(language \\ "es", view \\ "INTENT_VIEW_UNSPECIFIED", pageSize \\ 100, token \\ nil) do
    url = "intents?languageCode=#{language}&intentView=#{view}&pageSize=#{pageSize}&pageToken=#{token}"
    Flowex.request(:get, url, "")
  end

  @doc """
  Obtiene un intent buscando por id.
  """
  @spec get(String.t, String.t, String.t) :: tuple
  def get(id, languageCode \\ "es", intentView \\ "INTENT_VIEW_UNSPECIFIED") do
    url = "intents/#{id}?languageCode=#{languageCode}&intentView=#{intentView}"

    Flowex.request(:get, url, "")
  end

  @doc """
  Obtiene un intent buscando por id.
  """
  @spec patch(String.t, String.t, String.t) :: tuple
  def patch(id, languageCode \\ "es", text) do
    url = "intents/#{id}?languageCode=#{languageCode}&intentView=INTENT_VIEW_FULL"

    {:ok, intent} = get(id, languageCode, "INTENT_VIEW_FULL")

    intent =
      [%{
        "name" => UUID.uuid4(),
        "parts" => [%{"text" => text}],
        "type" => "EXAMPLE"
      }]
      |> Enum.concat(intent["trainingPhrases"])
      |> Map.put(intent, "trainingPhrases")
      |> Poison.encode!

    Flowex.request(:patch, url, intent)
  end
end
