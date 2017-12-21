defmodule Flowex do
  @moduledoc """
  Módulo que realiza las peticiones a Dialogflow.
  """

  def request(method, path, body) do
    host = Application.get_env(:flowex, :host)
    protocol_version = Application.get_env(:flowex, :protocol_version)

    url = "#{host}#{path}?v=#{protocol_version}"

    case HTTPoison.request(method, url, body, headers(), []) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Poison.decode!(body)}
      {:ok, %HTTPoison.Response{status_code: 400, body: body}} ->
        {:error, Poison.decode!(body)}
      {:ok, %HTTPoison.Response{status_code: 401, body: body}} ->
        {:error, Poison.decode!(body)}
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, :not_found}
      {:ok, %HTTPoison.Response{status_code: 409, body: body}} ->
        {:error, Poison.decode!(body)}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, Poison.decode!(reason)}
      response ->
        {:error, response}
    end
  end

  defp headers do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer " <> Application.get_env(:flowex, :developer_access_token)}
    ]
  end

end
