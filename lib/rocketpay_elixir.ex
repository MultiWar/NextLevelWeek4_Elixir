defmodule RocketpayElixir do
  alias RocketpayElixir.Users.Create, as: UserCreate
  alias RocketpayElixir.Accounts.Deposit
  alias RocketpayElixir.Accounts.Withdraw
  alias RocketpayElixir.Accounts.Transaction

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate deposit(params), to: Deposit, as: :call
  defdelegate withdraw(params), to: Withdraw, as: :call
  defdelegate transaction(params), to: Transaction, as: :call
end
