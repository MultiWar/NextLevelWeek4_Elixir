defmodule RocketpayElixirWeb.AccountsController do
  use RocketpayElixirWeb, :controller

  alias RocketpayElixir.Account
  alias RocketpayElixir.Accounts.Transactions.Response, as: TransactionResponse

  action_fallback RocketpayElixirWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- RocketpayElixir.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- RocketpayElixir.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <- RocketpayElixir.transaction(params) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
