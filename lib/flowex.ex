defmodule Flowex do
  @moduledoc """
  Módulo para manejar la API de DialogFlow v2.
  """

  alias Goth.Token

  @spec request(String.t(), atom, String.t(), String.t() | map) :: tuple
  def request(project, method, path, body) do
    %{"id" => id, "email" => email} = _project_info(project)

    url = "#{_host()}/v2/projects/#{id}/agent/#{path}"

    case HTTPoison.request(method, url, _body(body), _headers(email)) do
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
  # Encode body
  # ---------------------------------------------------------------------------
  @spec _body(String.t() | map) :: String.t
  defp _body(""), do: ""
  defp _body(body), do: Poison.encode!(body)

  # ---------------------------------------------------------------------------
  # Obtine el host de Dialogflow API
  # ---------------------------------------------------------------------------
  @spec _host :: String.t
  defp _host(), do: Application.get_env(:flowex, :host)

  # ---------------------------------------------------------------------------
  # Headers de la petición.
  # ---------------------------------------------------------------------------
  @spec _headers(String.t()) :: list
  defp _headers(email) do
    {:ok, token} = Token.for_scope({email, "https://www.googleapis.com/auth/cloud-platform"})

    [
      {"Authorization", "Bearer #{token.token}"},
      {"Content-Type", "application/json"}
    ]
  end

  # ---------------------------------------------------------------------------
  # Obtiene el id y email de un proyecto de dialogflow.
  # ---------------------------------------------------------------------------
  @spec _project_info(String.t) :: map
  defp _project_info(project_id) do
    :flowex
    |> Application.get_env(:projects_info)
    |> Poison.decode!()
    |> Enum.find(fn project -> project["id"] == project_id end)
  end
end
