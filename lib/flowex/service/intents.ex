defmodule Flowex.Service.Intents do
  @moduledoc """
  Helper para intents.
  """

  alias Flowex

  @doc """
  Lista los de intents de un agente.
  """
  @spec list(String.t, String.t, integer, String.t | nil) :: tuple
  def list(language \\ "es", view \\ "INTENT_VIEW_UNSPECIFIED", pageSize \\ 1, token \\ nil) do
    url = "intents?languageCode=#{language}&intentView=#{view}&pageSize=#{pageSize}&pageToken=#{token}"
    Flowex.request(:get, url, "")
  end

  @doc """
  Obtiene un intent buscando por id.
  """
  @spec get(String.t, String.t, String.t) :: tuple
  def get(id, language \\ "es", view \\ "INTENT_VIEW_UNSPECIFIED") do
    url = "intents/#{id}?languageCode=#{language}&intentView=#{view}"

    Flowex.request(:get, url, "")
  end

  @doc """
  Añade un frase de entrenamiento a un intent.
  """
  @spec add_training_phrase(String.t, String.t, String.t) :: tuple
  def add_training_phrase(id, text, language \\ "es") do
    url = "intents/#{id}?languageCode=#{language}&intentView=INTENT_VIEW_FULL"

    {:ok, intent} = get(id, language, "INTENT_VIEW_FULL")

    intent =
      [%{
        "name" => UUID.uuid4(),
        "parts" => [%{"text" => text}],
        "type" => "EXAMPLE"
      }]
      |> Enum.concat(intent["trainingPhrases"])
      |> (&Map.put(intent, "trainingPhrases", &1)).()
      |> Poison.encode!

    Flowex.request(:patch, url, intent)
  end
end
