defmodule Flowex.Service.Sessions do
  @moduledoc """
  Helper para manejar intents.
  """

  alias Flowex

  @doc """
  Procesa una consulta en lenguaje natural para detectar un intent con la respuesta
  apropiada.
  """
  @spec detect_intent(String.t(), String.t(), String.t(), String.t()) :: tuple
  def detect_intent(project, text, session_id, language \\ "es") do
    body = %{
      queryInput: %{
        text: %{
          text: text,
          languageCode: language
        }
      }
    }

    Flowex.request(project, :post, "sessions/#{session_id}:detectIntent", body)
  end
end
