defmodule RocketpayElixirWeb.UsersController do
  use RocketpayElixirWeb, :controller

  alias RocketpayElixir.User

  action_fallback RocketpayElixirWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- RocketpayElixir.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
