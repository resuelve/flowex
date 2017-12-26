defmodule Flowex.Api.Queries do
  @moduledoc """
  Proporciona metodos para manejar intents.
  """

  alias Flowex

  @doc """
  Realiza una query para procesarlo con un intent.
  """
  @spec query(list, String.t, String.t, String.t, String.t) :: tuple
  def query(contexts, lang, text, sessionId, timezone) do
    body =
      %{
        contexts: contexts,
        lang: lang,
        query: text,
        sessionId: sessionId,
        timezone: timezone
      }
      |> Poison.encode!

    Flowex.request(:post, "query", body)
  end

end
