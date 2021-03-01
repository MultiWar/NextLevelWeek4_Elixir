defmodule RocketpayElixirWeb.WelcomeController do
  use RocketpayElixirWeb, :controller

  alias RocketpayElixir.Numbers

  def index(conn, %{"filename" => filename}) do
    filename
    |> Numbers.sum_from_file()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %{result: result}}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Welcome to Rocketpay API. Here's your number: #{result}"})
  end

  defp handle_response({:error, %{message: reason}}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(%{message: reason})
  end
end
