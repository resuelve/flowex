defmodule Flowex.Api.Intents do
  @moduledoc """
  Proporciona metodos para manejar intents.
  """

  alias Flowex

  def list do
    Flowex.request(:get, "intents", nil)
    |> IO.inspect
  end

end
