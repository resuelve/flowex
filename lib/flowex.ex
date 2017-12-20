defmodule Flowex do
  @moduledoc """
  Módulo que realiza las peticiones a Dialogflow.
  """

  def request(method, path, body) do
    host = Application.get_env(:resuelve_bot, :host)
    protocol_version = Application.get_env(:resuelve_bot, :protocol_version)

    url = "#{host}#{path}?v=#{protocol_version}"

    IO.inspect HTTPoison.request(method, url, body \\ "", headers \\ [], options \\ [])
  end

end
