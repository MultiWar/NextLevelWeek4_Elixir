defmodule RocketpayElixirWeb.FallbackController do
  use RocketpayElixirWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(RocketpayElixirWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
