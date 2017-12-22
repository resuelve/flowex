defmodule Flowex do
  @moduledoc """
  Módulo que realiza las peticiones a Dialogflow.
  """

  def request(method, path, body) do
    host = Application.get_env(:flowex, :host)
    protocol_version = Application.get_env(:flowex, :protocol_version)

    url = "#{host}#{path}?v=#{protocol_version}"

    case HTTPoison.request(method, url, body, headers(), []) do
      {:ok, %HTTPoison.Response{status_code: status, body: body}} when status in 200..299 ->
        {:ok, Poison.decode!(body)}
      {:ok, %HTTPoison.Response{status_code: status, body: body}} when status in 400..499 ->
        {:error, Poison.decode!(body)}
      {:ok, %HTTPoison.Response{status_code: status, body: body}} when status >= 500 ->
        {:error, Poison.decode!(body)}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, Poison.decode!(reason)}
    end
  end

  defp headers do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer " <> Application.get_env(:flowex, :developer_access_token)}
    ]
  end

end
