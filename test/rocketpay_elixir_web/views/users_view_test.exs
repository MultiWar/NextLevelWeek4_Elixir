defmodule RocketpayElixirWeb.UsersViewTest do
  use RocketpayElixirWeb.ConnCase, async: true
  import Phoenix.View

  alias RocketpayElixir.{Account, User}
  alias RocketpayElixirWeb.UsersView

  test "renders create.json" do
    params = %{name: "Rafael", password: "123456", nickname: "Camarda", email: "rafael@banana.com", age: 27}

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} = RocketpayElixir.create_user(params)

    response = render(UsersView, "create.json", user: user)
    expected_response = %{
      message: "User created successfully",
      user: %{
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
        },
        id: user_id,
        name: "Rafael",
        nickname: "Camarda"
      }
    }
    assert expected_response == response
  end
end
