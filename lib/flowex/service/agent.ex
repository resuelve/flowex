defmodule Flowex.Service.Agent do
  @moduledoc """
  Helper para agent.
  """

  alias Flowex

  @doc """
  Obtiene el agente al que está asociado el project_id.
  """
  @spec get() :: tuple
  def get do
    Flowex.request(:get, "", "")
  end
end
