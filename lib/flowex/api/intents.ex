defmodule Flowex.Api.Intents do
  @moduledoc """
  Proporciona metodos para manejar intents.
  """

  alias Flowex

  def list do
    Flowex.request(:get, "intents", "")
  end

  def get(id) do
    Flowex.request(:get, "intents/#{id}", "")
  end

  def create(body) do
    body = Poison.encode!(body)
    Flowex.request(:post, "intents", body)
    |> IO.inspect
  end

end
