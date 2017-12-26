defmodule Flowex.Api.Intents do
  @moduledoc """
  Proporciona metodos para manejar intents.
  """

  alias Flowex

  @doc """
  Lista de intents.
  """
  @spec list() :: tuple
  def list do
    Flowex.request(:get, "intents", "")
  end

  @doc """
  Obtiene un intent buscando por id.
  """
  @spec get(String.t) :: tuple
  def get(id) do
    Flowex.request(:get, "intents/#{id}", "")
  end

  @doc """
  Crea un intent.
  """
  @spec create(map) :: tuple
  def create(body) do
    body = Poison.encode!(body)
    Flowex.request(:post, "intents", body)
  end

end
