defmodule RocketpayElixir.NumbersTest do
  use ExUnit.Case, async: true

  alias RocketpayElixir.Numbers

  describe "sum_from_file/1" do
    test "when there is a file with the given filename, return the sum of all of it's numbers" do
      response = Numbers.sum_from_file("numbers")

      expected_response = {:ok, %{result: 37}}

      assert response == expected_response
    end
  end

  describe "" do
    test "when there is NOT a file with the given filename, return an error" do
      response = Numbers.sum_from_file("teste")

      expected_response = {:error, %{message: "invalid file"}}

      assert response == expected_response
    end
  end
end
