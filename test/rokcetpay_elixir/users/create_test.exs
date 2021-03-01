defmodule RocketpayElixir.Users.CreateTest do
  use RocketpayElixir.DataCase, async: true

  alias RocketpayElixir.Users.Create
  alias RocketpayElixir.{User, Repo}

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{name: "Rafael", password: "123456", nickname: "Camarda", email: "rafael@banana.com", age: 27}

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Rafael", age: 27, id: ^user_id} = user
    end

    test "when there are invalid params, returns an error" do
      params = %{name: "Rafael", nickname: "Camarda", email: "rafaelbanana.com", age: 27}

      {:error, changeset} = Create.call(params)

      expected_response = %{email: ["has invalid format"], password: ["can't be blank"]}
      assert errors_on(changeset) == expected_response
    end
  end
end
