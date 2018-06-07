defmodule Flowex do
  @moduledoc """
  Módulo para manejar la API de DialogFlow v2.
  """

  alias Goth.Token

  def request(method, path, body) do
    host = Application.get_env(:flowex, :host)
    project_id = Application.get_env(:flowex, :project_id)

    url = "#{host}/v2/projects/#{project_id}/agent/#{path}"

    case HTTPoison.request(method, url, body, headers()) do
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

  # ---------------------------------------------------------------------------
  # Headers de la petición.
  # ---------------------------------------------------------------------------
  @spec headers() :: list
  defp headers() do
    {:ok, token} = Token.for_scope("https://www.googleapis.com/auth/cloud-platform")

    [
      {"Authorization", "Bearer #{token.token}"},
      {"Content-Type", "application/json"}
    ]
  end
end
