defmodule Flowex.Service.Agent do
  @moduledoc """
  Helper para agent.
  """

  alias Flowex

  @doc """
  Recupera el agente que está asociado al project_id.
  """
  @spec get() :: tuple
  def get do
    Flowex.request(:get, "", "")
  end
end
