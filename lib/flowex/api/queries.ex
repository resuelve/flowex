defmodule Flowex.Api.Queries do
  @moduledoc """
  Proporciona metodos para manejar intents.
  """

  alias Flowex

  def list do
    Flowex.request(:get, "query", "")
  end

end
