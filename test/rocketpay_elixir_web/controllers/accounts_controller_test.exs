defmodule RocketpayElixirWeb.AccountsControllerTest do
  use RocketpayElixirWeb.ConnCase, async: true

  alias RocketpayElixir.{User, Repo, Account}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{name: "Rafael", password: "123456", nickname: "Camarda", email: "rafael@banana.com", age: 27}

      {:ok, %User{account: %Account{id: account_id}}} = RocketpayElixir.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic #{Base.encode64("banana:nanica123")}")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, complete the deposit successfully", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert %{"account" => %{"balance" => "50.00", "id" => _account_id}, "message" => "Balance changed successfully"} = response
    end

    test "when there are invalid parameteres, return an error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "-50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      assert %{"message" => %{"accounts" => ["is invalid"]}} = response
    end

  end
end
