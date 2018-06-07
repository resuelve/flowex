defmodule Flowex.Service.Intents do
  @moduledoc """
  Helper para intents.
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
end
