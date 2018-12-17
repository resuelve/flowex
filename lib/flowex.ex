defmodule Flowex do
  @moduledoc """
  Módulo para manejar la API de DialogFlow v2.
  """

  alias Goth.Token

  @spec request(String.t(), atom, String.t(), String.t()) :: tuple
  def request(project, method, path, body) do
    %{"id" => id, "email" => email} = project_info(project)

    host = Application.get_env(:flowex, :host)
    url = "#{host}/v2/projects/#{id}/agent/#{path}"

    case HTTPoison.request(method, url, body, headers(email)) do
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
  # Obtiene el id y email de un proyecto de dialogflow.
  # ---------------------------------------------------------------------------
  @spec project_info(String.t) :: map
  defp project_info(project_id) do
    :flowex
    |> Application.get_env(:projects_info)
    |> Poison.decode!()
    |> Enum.find(fn project -> project["id"] == project_id end)
  end

  # ---------------------------------------------------------------------------
  # Headers de la petición.
  # ---------------------------------------------------------------------------
  @spec headers(String.t()) :: list
  defp headers(email) do
    {:ok, token} = Token.for_scope({email, "https://www.googleapis.com/auth/cloud-platform"})

    [
      {"Authorization", "Bearer #{token.token}"},
      {"Content-Type", "application/json"}
    ]
  end
end
