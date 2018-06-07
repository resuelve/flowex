defmodule Flowex.Service.Sessions do
  @moduledoc """
  Helper para manejar intents.
  """

  alias Flowex

  @doc """
  Procesa una consulta en lenguaje natural y devuelve datos
  estructurados y procesables como resultado.
  """
  @spec detect_intent(String.t, String.t) :: tuple
  def detect_intent(text, session_id) do
    body =
      %{
        queryInput: %{
          text: %{
            text: text,
            languageCode: "es"
          }
        }
      }
      |> Poison.encode!

    Flowex.request(:post, "sessions/#{session_id}:detectIntent", body)
  end

end
