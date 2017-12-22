defmodule Flowex.Api.Queries do
  @moduledoc """
  Proporciona metodos para manejar intents.
  """

  alias Flowex

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
