defmodule Flowex.Service.Agent do
  @moduledoc """
  Helper para información del agente.
  """

  alias Flowex

  @doc """
  Obtiene el agente al que está asociado el projecto.
  """
  @spec get(Strint.t) :: tuple
  def get(project) do
    Flowex.request(project, :get, "", "")
  end
end
